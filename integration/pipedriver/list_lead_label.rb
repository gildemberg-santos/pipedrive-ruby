module Integration::Pipedriver
  class ListLeadLabel < Base
    def call
      leadlabels
    end

    private

    def leadlabels
      @leadlabels ||= list.map do |item|
        { id: item['id'], name: item['name'], color: item['color'] }
      end
    end

    def list
      result = request('leadLabels', :get)
      result [] if result.code != 200

      JSON.parse(result.body)['data'] || []
    end
  end
end
