module Integrations
  module Pipedrive
    class CreateOrganization < Base
      ENDPOINT = 'organizations'.freeze
      REQUIRED_NAME = "Por favor, forneça o 'nome' da Organização para prosseguir. Este campo é obrigatório.".freeze

      private

      def response
        errors?
        @response ||= create
        {
          id: @response[:id],
          company_id: @response[:company_id],
          name: @response[:name]
        }
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
