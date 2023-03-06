module Integration::Pipedriver
  class ListOrganization < Base
    private def response
      @response ||= find_all('organizations').map do |item|
        { id: item['id'], name: item['name'] }
      end
    end
  end
end
