module Integration::Pipedriver
  class Person < Base
    def initialize(params)
      @params = params
    end

    def call
      puts 'Person#call'
      create
    end

    private

    def create
      raise 'Name requered' unless @params.dig(:name)

      puts 'Person#create'
    end
  end
end
