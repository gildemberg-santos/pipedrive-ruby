module Integration::Pipedriver
  class ListLeadLabel < Base
    private def response
      @response ||= find_all('leadLabels').map do |item|
        { id: item[:id], name: item[:name], color: item[:color] }
      end
    end
  end
end
