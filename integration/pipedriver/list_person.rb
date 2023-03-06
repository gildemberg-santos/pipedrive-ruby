module Integration::Pipedriver
  class ListPerson < Base
    private def response
      @response ||= find_all('persons').map do |item|
        {
          id: item[:id],
          company_id: item[:company_id],
          name: item[:name]
        }
      end
    end
  end
end
