module Integration::Pipedriver
  class Base
    def initialize(company_domain, api_token, params = {})
      @company_domain = company_domain
      @api_token = api_token
      @params = params
    end

    private

    def request(endpoint, method, payload = nil)
      Request.new(@company_domain, @api_token).call(endpoint, method, payload)
    end
  end
end
