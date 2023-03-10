require 'rails'
require 'httparty'
require 'pry'
require 'json'
require './integrations/pipedrive_service'
require './integrations/pipedrive/credential'
require './integrations/pipedrive/base'
require './integrations/pipedrive/request'
require './integrations/pipedrive/list_user'
require './integrations/pipedrive/list_organization'
require './integrations/pipedrive/list_lead'
require './integrations/pipedrive/list_person'
require './integrations/pipedrive/list_lead_label'
require './integrations/pipedrive/list_person_field'
require './integrations/pipedrive/create_lead'
require './integrations/pipedrive/create_person'
require './integrations/pipedrive/create_lead_label'
require './integrations/pipedrive/create_organization'

COMPANY_DOMAIN = 'gilsantos-sandbox'.freeze
API_TOKEN = '99141214036cdd7bf35e96984424be27a1be5b9f'.freeze
PARAMS = {
  name: 'Gildemberg Santos Gomes',
  title: 'Nove Lead',
  color: 'red'
}.freeze

credential = Integrations::Pipedrive::Credential.new(COMPANY_DOMAIN, API_TOKEN)
Integrations::PipedriveService.new(credential, PARAMS).call
