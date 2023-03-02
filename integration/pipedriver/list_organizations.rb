module Integration::Pipedriver
  class ListOrganizations < Base
    def call
      organizations
    end

    private

    def organizations
      @organizations ||= list.map do |item|
        { id: item['id'], name: item['name'] }
      end
    end

    def list
      result = request('organizations', :get)
      return [] if result.code != 200

      JSON.parse(result.body)['data'] || []
    end
  end
end
