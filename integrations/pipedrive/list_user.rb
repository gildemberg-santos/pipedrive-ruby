module Integrations
  module Pipedrive
    class ListUser < Base
      private

      def response
        @response ||= find_all('users').map do |item|
          { id: item[:id], name: item[:name], errors: @erros }
        end
      end
    end
  end
end
