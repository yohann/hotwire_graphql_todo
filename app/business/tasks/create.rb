module Tasks
  class Create < ApplicationBusiness
    def initialize(name, description)
      @name = name
      @description = description
    end

    def call
      Task.create(name: @name, description: @description)
    end
  end
end
