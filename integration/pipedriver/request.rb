module Integration::Pipedriver
  class Request
    def call(url = 'http://www.google.com')
      HTTParty.get(url)
    end
  end
end
