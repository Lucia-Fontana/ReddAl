require 'rails_helper'

RSpec.describe AiRequestJob, type: :job do
  let(:ai_request_params) do
    {
      ai_model: 'davinci',
      prompt: 'Test prompt',
      uuid: '12345'
    }
  end



  before do
    connection = instance_double(Faraday::Connection)
    request = instance_double(Faraday::Request)
    response = instance_double(Faraday::Response, body: '{"choices": [{"text": "Generated idea"}]}')

    allow(Faraday).to receive(:new).and_return(connection)
    allow(connection).to receive(:post) do |&block|
      block.call(request)
      response
    end

    allow(request).to receive(:url).with("/v1/engines/davinci/completions")
    allow(request).to receive(:headers).and_return({})
    allow(request).to receive(:body=).with(
    '{"prompt":"Test prompt","max_tokens":100,"temperature":0.5,"n":1}'
    )
  end

  it 'performs the job and broadcasts the generated idea' do
    allow(Turbo::StreamsChannel).to receive(:broadcast_update_to)
    AiRequestJob.new.perform(ai_request_params, api_key)
    expect(Turbo::StreamsChannel).to have_received(:broadcast_update_to).with(
      "channel_12345",
      target: 'ai_output',
      partial: 'ai/output',
      locals: { generated_idea: 'Generated idea' }
    )
  end

end
