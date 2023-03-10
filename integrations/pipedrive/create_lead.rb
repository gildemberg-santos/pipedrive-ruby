module Integrations
  module Pipedrive
    class CreateLead < Base
      ENDPOINT = 'leads'.freeze
      REQUIRED_TITLE = "Por favor, forneça o 'título' do lead para \
      prosseguir. Este campo é obrigatório.".freeze

      private

      def response
        errors?
        @response ||= create
        { id: @response[:id], title: @response[:title], erros: @errors }
      end

      def errors?
        count_error = 0

        if @params[:title].blank?
          @erros.push(REQUIRED_TITLE)
          count_error += 1
        end

        count_error.positive?
      end
    end
  end
end
