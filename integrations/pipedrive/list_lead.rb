module Integrations
  module Pipedrive
    class ListLead < Base
      ENDPOINT = 'leads'.freeze

      private

      def response
        @response ||= find_all(ENDPOINT).map do |item|
          {
            id: item[:id],
            title: item[:title],
            owner_id: item[:owner_id],
            organization_id: item[:organization_id],
            label_ids: item[:label_ids],
            person_id: item[:person_id],
            errors: @erros
          }
        end
      end
    end
  end
end
