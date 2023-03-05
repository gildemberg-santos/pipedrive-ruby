module Integration::Pipedriver
  class CreatePerson < Base
    REQUIRED_PERSON_NAME = "Por favor, forneça o 'nome' do contato para prosseguir. Este campo é obrigatório."

    def call
      create
    end

    private

    def create
      raise StandardError, REQUIRED_PERSON_NAME if @params[:name].blank?

      puts "Person#create #{@params}"
    end
  end
end
