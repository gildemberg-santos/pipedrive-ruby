module Integrations
  class PipedriveService
    def initialize(credential, params)
      @credential = credential
      @params = params
    end

    def call
      owners = Pipedrive::ListUser.new(@credential).call
      organizations = Pipedrive::ListOrganization.new(@credential).call
      leads = Pipedrive::ListLead.new(@credential).call
      person_fields = Pipedrive::ListPersonField.new(@credential).call

      puts "PROGRAMS ========================"
      puts "Owners #{owners}"
      puts "Organizations #{organizations}"
      puts "Leads #{leads}"
      puts "Fields Person #{person_fields}"

      # puts "\n\n"
      
      # person = {
      #   name: 'Gildemberg Santos Gomes',
      #   owner_id: owners.first[:id],
      #   org_id: organizations.first[:id],
      #   email: 'gildemberg.santos@gmail.com',
      #   phone: '(85) 99136-5507'
      # }

      # response_person = Pipedrive::CreatePerson.new(@company_domain, @api_token, person).call

      # puts "Person#Create #{response_person}"

      # lead = {
      #   title: "Novo Lead",
      #   owner_id: owners.first[:id],
      #   person_id: response_person[:id],
      #   organization_id: organizations.first[:id]
      # }
      # response_lead = Pipedrive::CreateLead.new(@company_domain, @api_token, lead).call

      # puts "Lead#Create #{response_lead}"

      # puts "\n\n"

      # unless response_person[:erros].blank? || response_lead[:erros].blank?
      #   erros = []
      #   erros.push(response_person[:erros])
      #   erros.push(response_lead[:erros])
      #   raise StandardError, erros
      # end
      puts "PROGRAMS ========================"
    end
  end
end
