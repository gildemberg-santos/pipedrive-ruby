module Integration::Pipedriver
  class CreateLead < Base
    def call
      create
    end

    private

    def create
      raise RequiredLeadTitle if @params[:title].blank?

      puts 'Lead#create_lead'
    end
  end
end
