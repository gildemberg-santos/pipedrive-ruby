module Integrations
  module Pipedrive
    class CreateLeadLabel < Base
      ENDPOINT = 'leadLabels'.freeze
      REQUIRED_NAME = "Por favor, forneça o 'nome' do lead label para prosseguir. Este campo é obrigatório.".freeze
      REQUIRED_COLOR = "Por favor, forneça a 'cor' do lead label para prosseguir. Este campo é obrigatório.".freeze

      private

      def response
        errors?
        @response ||= create
        { id: @response[:id], name: @response[:name], erros: @erros }
      end

      def errors?
        count_error = 0

        if @params[:name].blank?
          @erros.push(REQUIRED_NAME)
          count_error += 1
        end

        if @params[:color].blank?
          @erros.push(REQUIRED_COLOR)
          count_error += 1
        end

        count_error.positive?
      end
    end
  end
end
