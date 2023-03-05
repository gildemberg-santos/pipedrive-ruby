module Integration::Pipedriver
  class CreateLeadLabel < Base
    REQUIRED_LEADLABEL_NAME = "Por favor, forneça o 'nome' do lead label para prosseguir. Este campo é obrigatório."
    REQUIRED_LEADLABEL_COLOR = "Por favor, forneça a 'cor' do lead label para prosseguir. Este campo é obrigatório."

    def call
      create
    end

    private

    def create
      raise StandardError, REQUIRED_LEADLABEL_NAME if @params[:name].blank?
      raise StandardError, REQUIRED_LEADLABEL_COLOR if @params[:color].blank?

      puts 'Lead#create_lead'
    end
  end
end
