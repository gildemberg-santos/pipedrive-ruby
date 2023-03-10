module Integrations
  module Pipedrive
    class ListPersonField < Base
      private

      def response
        @response ||= find_all('personFields').map do |item|
          {
            id: item[:id],
            key: item[:key],
            name: item[:name],
            field_type: item[:field_type],
            errors: @erros
          }
        end
      end
    end
  end
end
