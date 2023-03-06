require 'rails'
require './integration/pipedriver_service'
require './integration/pipedriver/credential'
require './integration/pipedriver/base'
require './integration/pipedriver/request'
require './integration/pipedriver/list_user'
require './integration/pipedriver/list_organization'
require './integration/pipedriver/list_lead'
require './integration/pipedriver/list_person'
require './integration/pipedriver/list_lead_label'
require './integration/pipedriver/list_person_field'
require './integration/pipedriver/create_lead'
require './integration/pipedriver/create_person'
require './integration/pipedriver/create_lead_label'
require './integration/pipedriver/create_organization'
require 'httparty'
require 'pry'
require 'json'

COMPANY_DOMAIN = 'gilsantos-sandbox'
API_TOKEN = '99141214036cdd7bf35e96984424be27a1be5b9f'
PARAMS = {
  name: 'Gildemberg Santos Gomes',
  title: 'Nove Lead',
  color: 'red'
}

credential = ::Integration::Pipedriver::Credential.new(COMPANY_DOMAIN, API_TOKEN)
::Integration::PipedriverService.new(credential, PARAMS).call
