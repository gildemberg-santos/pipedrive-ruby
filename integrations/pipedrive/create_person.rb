module Integrations
  module Pipedrive
    class CreatePerson < Base
      ENDPOINT = 'persons'.freeze
      REQUIRED_NAME = "Por favor, forneça o 'nome' do contato para prosseguir. \
      Este campo é obrigatório.".freeze

      private

      def response
        errors?
        @response ||= create
        { id: @response[:id], name: @response[:name], errors: @erros }
      end

      def errors?
        count_error = 0

        if @params[:name].blank?
          @erros.push(REQUIRED_NAME)
          count_error += 1
        end

        count_error.positive?
      end
    end
  end
end
