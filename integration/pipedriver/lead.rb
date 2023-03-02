module Integration::Pipedriver
  class Lead < Base
    def initialize(params)
      @params = params
    end

    def call
      puts 'Lead#call'
      create_lead
      self
    end

    private

    def create_lead
      raise 'Title requered' unless @params[:title]

      puts 'Lead#create_lead'
      # request
    end
  end
end
