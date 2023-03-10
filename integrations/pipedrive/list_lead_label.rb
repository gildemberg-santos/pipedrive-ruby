module Integrations
  module Pipedrive
    class ListLeadLabel < Base
      ENDPOINT = 'leadLabels'.freeze

      private

      def response
        @response ||= find_all(ENDPOINT).map do |item|
          {
            id: item[:id],
            name: item[:name],
            color: item[:color],
            errors: @erros
          }
        end
      end
    end
  end
end
