module Integration::Pipedriver
  class Base
    def initialize(company_domain = nil, api_token = nil)
      @company_domain = company_domain || "gilsantos-sandbox"
      @api_token = api_token || "99141214036cdd7bf35e96984424be27a1be5b9f"
    end

    def call
      raise NotImplementedError
    end

    private

    def request(endpoint = '')
      @request ||= Request.new.call(url endpoint)
    end

    def url(endpoint)
      @url ||= "https://#{@company_domain}.pipedrive.com/v1/#{endpoint}?api_token=#{@api_token}"
    end
  end
end
