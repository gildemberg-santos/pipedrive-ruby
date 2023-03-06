module Integration::Pipedriver
  class Request
    def initialize(credential)
      @credential = credential
    end

    def call(endpoint, method, payload = nil)
      @payload = payload
      @endpoint = endpoint

      HTTParty.send(method, url, { verify: true, body: body, headers: headers })
    end

    private

    def headers
      { 'Content-Type': 'application/json' }
    end

    def body
      @payload.present? ? @payload.to_json : nil
    end

    def url
      @url ||= "https://#{@credential.domain}.pipedrive.com/v1/#{@endpoint}?api_token=#{@credential.token}"
    end
  end
end
