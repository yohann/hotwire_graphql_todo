module Tasks
  class Index
    DEFAULT_SORT = { created_at: :desc }
    def initialize(state = nil)
      @state = state
    end

    def call
      @state = nil if @state&.downcase == "all"
      return [] if @state && !Task.states.include?(@state)

      @tasks = @state ? Task.where(state_cd: @state.downcase) : Task.all
      @tasks.order(DEFAULT_SORT)
    end
  end
end
