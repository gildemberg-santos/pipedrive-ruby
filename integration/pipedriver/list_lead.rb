module Integration::Pipedriver
  class ListLead < Base
    def call
      leads
    end

    private

    def leads
      @leads ||= list.map do |item|
        {
          id: item['id'],
          title: item['title'],
          owner_id: item['owner_id'],
          organization_id: item['organization_id'],
          label_ids: item['label_ids'],
          person_id: item['person_id']
        }
      end
    end

    def list
      result = request('leads', :get)
      return [] if result.code != 200

      JSON.parse(result.body)['data'] || []
    end
  end
end
