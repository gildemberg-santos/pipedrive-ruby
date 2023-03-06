module Integration::Pipedriver
  class CreateOrganization < Base
    ENDPOINT = 'organizations'
    REQUIRED_NAME = "Por favor, forneça o 'nome' da Organização para prosseguir. Este campo é obrigatório."

    private

    def response
      @response ||= create.deep_symbolize_keys
      {
        id: @response[:id],
        company_id: @response[:company_id],
        name: @response[:name]
      }
    end

    def create
      @erros.push(REQUIRED_NAME) and return {} if @params[:name].blank?

      result = request(ENDPOINT, :post, @params)
      @erros.push(JSON.parse(result.body)['error']) and return {} if result.code != 201

      JSON.parse(result.body)['data'] || {}
    end
  end
end
