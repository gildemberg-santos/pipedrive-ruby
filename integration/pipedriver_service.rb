module Integration
  class PipedriverService
    def initialize(company_domain, api_token, params)
      @company_domain = company_domain
      @api_token = api_token
      @params = params
    end

    def call
      owners = Pipedriver::ListUsers.new(@company_domain, @api_token).call
      organizations = Pipedriver::ListOrganizations.new(@company_domain, @api_token).call

      puts "PROGRAMS ========================\n\n"
      puts "Owners #{owners}\n\n"
      puts "Organizations #{organizations}\n\n"
      
      Pipedriver::CreatePerson.new(@company_domain, @api_token, @params).call
      Pipedriver::CreateLead.new(@company_domain, @api_token, @params).call
      puts "PROGRAMS ========================"
    end
  end
end
