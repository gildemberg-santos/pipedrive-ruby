module Integration::Pipedriver
  class Credential
    attr_reader :domain, :token

    def initialize(domain, token)
      @domain = domain
      @token = token
    end
  end
end
