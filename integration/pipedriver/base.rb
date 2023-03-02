module Integration::Pipedriver
  class Base
    def initialize(company_domain, api_token, params = {})
      @company_domain = company_domain
      @api_token = api_token
      @params = params
    end

    private

    def request(endpoint, method, payload = nil)
      @payload = payload
      @endpoint = endpoint

      HTTParty.send(method, url, { verify: true, body: body, headers: headers })
    end

    def headers
      { 'Content-Type': 'application/json' }
    end

    def body
      @payload.present? ? @payload.to_json : nil
    end

    def url
      @url ||= "https://#{@company_domain}.pipedrive.com/v1/#{@endpoint}?api_token=#{@api_token}"
    end
  end
end
