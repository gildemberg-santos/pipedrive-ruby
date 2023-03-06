module Integrations::Pipedrive
  class ListLeadLabel < Base
    ENDPOINT = 'leadLabels'
    
    private def response
      @response ||= find_all(ENDPOINT).map do |item|
        { id: item[:id], name: item[:name], color: item[:color] }
      end
    end
  end
end
