module Integration::Pipedriver
  class ListPerson < Base
    def call
      persons
    end

    private

    def persons
      @persons ||= list.map do |item|
        {
          id: item['id'],
          company_id: item['company_id'],
          name: item['name']
        }
      end
    end

    def list
      result = request('persons', :get)
      return [] if result.code != 200

      JSON.parse(result.body)['data'] || []
    end
  end
end
