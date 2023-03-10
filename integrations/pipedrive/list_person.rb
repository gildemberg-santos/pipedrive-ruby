module Integrations
  module Pipedrive
    class ListPerson < Base
      private

      def response
        @response ||= find_all('persons').map do |item|
          {
            id: item[:id],
            company_id: item[:company_id],
            name: item[:name],
            errors: @erros
          }
        end
      end
    end
  end
end
