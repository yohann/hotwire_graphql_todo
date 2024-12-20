module Tasks
  class Update
    def initialize(id, name, description)
      @id = id
      @name = name
      @description = description
    end

    def call
      task = Task.find(@id)
      task&.update(name: @name, description: @description)
    end
  end
end
