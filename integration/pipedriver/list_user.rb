module Integration::Pipedriver
  class ListUser < Base
    def call
      users
    end

    private
    
    def users
      @users ||= list.map do |item|
        { id: item['id'], name: item['name'] }
      end
    end

    def list
      result = request('users', :get)
      return [] if result.code != 200

      JSON.parse(result.body)['data'] || []
    end
  end
end
