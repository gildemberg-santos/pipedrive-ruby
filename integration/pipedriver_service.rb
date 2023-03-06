module Integration
  class PipedriverService
    def initialize(company_domain, api_token, params)
      @company_domain = company_domain
      @api_token = api_token
      @params = params
    end

    def call
      owners = Pipedriver::ListUser.new(@company_domain, @api_token).call
      organizations = Pipedriver::ListOrganization.new(@company_domain, @api_token).call
      leads = Pipedriver::ListLead.new(@company_domain, @api_token).call
      persons = Pipedriver::ListPerson.new(@company_domain, @api_token).call
      lead_labels = Pipedriver::ListLeadLabel.new(@company_domain, @api_token).call

      puts "PROGRAMS ========================"
      puts "Owners #{owners}"
      puts "Organizations #{organizations}"
      puts "Leads #{leads}"
      puts "Persons #{persons}"
      puts "LeadLabels #{lead_labels}"
      
      Pipedriver::CreatePerson.new(@company_domain, @api_token, @params).call
      Pipedriver::CreateLead.new(@company_domain, @api_token, @params).call
      Pipedriver::CreateLeadLabel.new(@company_domain, @api_token, @params).call
      puts "PROGRAMS ========================"
    end
  end
end
