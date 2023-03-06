module Integration::Pipedriver
  class ListUser < Base
    private def response
      @response ||= find_all('users').map do |item|
        { id: item[:id], name: item[:name] }
      end
    end
  end
end
