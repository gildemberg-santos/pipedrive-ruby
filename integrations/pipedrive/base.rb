module Integrations
  module Pipedrive
    class Base
      attr_reader :erros

      def initialize(credential, params = {})
        @erros = []
        @credential = credential
        @params = params
      end

      def call
        response
      end

      private

      def request(endpoint, method, payload = nil)
        Request.new(@credential).call(endpoint, method, payload)
      end

      def find_all(endpoit)
        result = request(endpoit, :get)
        return [] if result.code != 200

        JSON.parse(result.body)['data'].each(&:deep_symbolize_keys!) || []
      end

      def create
        result = request(ENDPOINT, :post, @params)
        @erros.push(JSON.parse(result.body)['error']) and return {} if result.code != 201

        JSON.parse(result.body)['data'].deep_symbolize_keys || {}
      end

      def response
        raise NotImplementedError
      end

      def errors?
        raise NotImplementedError
      end
    end
  end
end
