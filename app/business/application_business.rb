class ApplicationBusiness
  attr_accessor :success, :error, :errors

  def self.call(...)
    new(...).call
  end

  def self.call!(...)
    new(...).call!
  end
end
