require 'rails'
require './integration/pipedriver_service'
require './integration/pipedriver/erros'
require './integration/pipedriver/base'
require './integration/pipedriver/list_users'
require './integration/pipedriver/list_organizations'
require './integration/pipedriver/create_lead'
require './integration/pipedriver/create_person'

require 'httparty'
require 'pry'
require 'json'

COMPANY_DOMAIN = 'gilsantos-sandbox'
API_TOKEN = '99141214036cdd7bf35e96984424be27a1be5b9f'
PARAMS = {
  name: "Gildemberg Santos Gomes",
  title: "Nove Lead"
}

::Integration::PipedriverService.new(COMPANY_DOMAIN, API_TOKEN, PARAMS).call
