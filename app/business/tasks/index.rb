module Tasks
  class Index
    def initialize(state)
      @state = state
    end

    def call
      @state = nil if @state.downcase == "all"
      return [] if @state && !Task.states.include?(@state)

      @state ? Task.where(state_cd: @state.downcase) : Task.all
    end
  end
end
