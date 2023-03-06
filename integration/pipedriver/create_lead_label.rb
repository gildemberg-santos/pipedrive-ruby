module Integration::Pipedriver
  class CreateLeadLabel < Base
    REQUIRED_NAME = "Por favor, forneça o 'nome' do lead label para prosseguir. Este campo é obrigatório."
    REQUIRED_COLOR = "Por favor, forneça a 'cor' do lead label para prosseguir. Este campo é obrigatório."

    def call
      create
    end

    private

    def create
      raise StandardError, REQUIRED_NAME if @params[:name].blank?
      raise StandardError, REQUIRED_COLOR if @params[:color].blank?

      puts "LeadLabel#create #{@params}"
    end
  end
end
