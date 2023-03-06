module Integration::Pipedriver
  class CreateLead < Base
    REQUIRED_TITLE = "Por favor, forneça o 'título' do lead para prosseguir. Este campo é obrigatório."

    private

    def response
      @response ||= create.deep_symbolize_keys
      { id: @response[:id], title: @response[:title], erros: @erros }
    end

    def create
      @error.push(REQUIRED_TITLE) and return {} if @params[:title].blank?

      result = request('leads', :post, @params)
      @erros.push(JSON.parse(result.body)['error']) and return {} if result.code != 201

      JSON.parse(result.body)['data'] || {}
    end
  end
end
