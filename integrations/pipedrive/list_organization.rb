module Integrations
  module Pipedrive
    class ListOrganization < Base
      ENDPOINT = 'organizations'.freeze

      private

      def response
        @response ||= find_all(ENDPOINT).map do |item|
          { id: item[:id], name: item[:name] }
        end
      end
    end
  end
end
