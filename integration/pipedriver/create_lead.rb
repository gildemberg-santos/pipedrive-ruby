module Integration::Pipedriver
  class CreateLead < Base
    REQUIRED_LEAD_TITLE = "Por favor, forneça o 'título' do lead para prosseguir. Este campo é obrigatório."
    
    def call
      create
    end

    private

    def create
      raise StandardError, REQUIRED_LEAD_TITLE if @params[:title].blank?

      puts 'Lead#create_lead'
    end
  end
end
