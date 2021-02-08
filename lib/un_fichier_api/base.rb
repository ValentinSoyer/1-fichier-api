# frozen_string_literal: true

require 'faraday'
require 'un_fichier_api/helpers/request_helper'

module UnFichierApi
  class Base
    include Helpers::RequestHelper

    # Attributes
    class_attribute :api_key

    # Methods
    class << self
      def call(path:, method: :post, body: {})
        response = connection.send(method, path) do |req|
          req.body = body.to_json
        end

        JSON.parse response.body
      end

      def connection
        @connection ||= Faraday.new(
          url: 'https://api.1fichier.com/v1',
          headers: { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{api_key}" }
        )
      end
    end
  end
end
