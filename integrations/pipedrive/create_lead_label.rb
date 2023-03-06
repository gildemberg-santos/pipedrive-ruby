module Integrations::Pipedrive
  class CreateLeadLabel < Base
    ENDPOINT = 'leadLabels'
    REQUIRED_NAME = "Por favor, forneça o 'nome' do lead label para prosseguir. Este campo é obrigatório."
    REQUIRED_COLOR = "Por favor, forneça a 'cor' do lead label para prosseguir. Este campo é obrigatório."

    private

    def response
      @response ||= create
      { id: @response[:id], name: @response[:name], erros: @erros }
    end

    def create
      @erros.push(REQUIRED_NAME) if @params[:name].blank?
      @erros.push(REQUIRED_COLOR) if @params[:color].blank?

      result = request(ENDPOINT, :post, @params)
      @erros.push(JSON.parse(result.body)['error']) and return {} if result.code != 201

      JSON.parse(result.body)['data'].deep_symbolize_keys || {}
    end
  end
end
