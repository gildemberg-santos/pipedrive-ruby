module Integration::Pipedriver
  class CreatePerson < Base
    ENDPOINT = 'persons'
    REQUIRED_NAME = "Por favor, forneça o 'nome' do contato para prosseguir. Este campo é obrigatório."

    private

    def response
      @response ||= create.deep_symbolize_keys
      { id: @response[:id], name: @response[:name], erros: @erros }
    end

    def create
      @erros.push(REQUIRED_NAME) and return {} if @params[:name].blank?

      result = request(ENDPOINT, :post, @params)
      @erros.push(JSON.parse(result.body)['error']) and return {} if result.code != 201

      JSON.parse(result.body)['data'] || {}
    end
  end
end
