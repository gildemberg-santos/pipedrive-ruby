module Integration::Pipedriver
  class ListLead < Base
    private def response
      @response ||= find_all('leads').map do |item|
        {
          id: item[:id],
          title: item[:title],
          owner_id: item[:owner_id],
          organization_id: item[:organization_id],
          label_ids: item[:label_ids],
          person_id: item[:person_id]
        }
      end
    end
  end
end
