module Integration::Pipedriver
  class ListOrganization < Base
    ENDPOINT = 'organizations'
    
    private def response
      @response ||= find_all(ENDPOINT).map do |item|
        { id: item[:id], name: item[:name] }
      end
    end
  end
end
