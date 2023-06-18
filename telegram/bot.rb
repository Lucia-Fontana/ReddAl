require File.expand_path('../config/environment', __dir__)
require 'telegram/bot'

token = "6083010351:AAEsOufTAKpYsLUBo_ju0PB3KAa_DsrDGiE"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

  if !User.exists?(telegram_id: message.from.id)
    User.create(telegram_id: message.from.id, username: message.from.first_name)
  else
    user = User.find_by(telegram_id: message.from.id)
  end

# case user.step
#   when "add"
#     user.bots.create(username: message.text)
#     user.step = "description"
#     user.save
#     bot.api.send_message(chat_id: message.chat.id, text: "Send me bot description")
#   when "description"
#     new_bot = user.bots.last
#     new_bot.description = message.text
#     new_bot.save
#     bot.api.send_message(chat_id: message.chat.id, text: "Thank you I saved your bot")
#     user.step = nil
#     user.save
#   when "delete"
#   when "search"
#   end

    case message.text
    when "/add"
      # user.step = "add"
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: "Send me bot username")
    when "/delete"
      # user.step = "delete"
      user.save
      user.bots.map{|u_bot| u_bot.username}
      bot.api.send_message(chat_id: message.chat.id, text: "Pick bot to delete")
    when "/search"
      # user.step = "search"
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: "Send me your request")
    end
  end
end
