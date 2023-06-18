class Strategy
  def call
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
