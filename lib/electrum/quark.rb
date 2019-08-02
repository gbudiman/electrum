# frozen_string_literal: true

require 'json'
require 'unirest'
require 'awesome_print'
require 'byebug'

module Electrum
  class Quark
    ENDPOINT = 'https://devdrdb.dystopiarisingnetwork.com/api'
    Unirest.default_header('Accept', 'application/json')

    attr_reader :access_token

    def initialize(username, password)
      @username = username
      @password = password
    end

    def login
      response = Unirest.get(
        [ENDPOINT, 'generateToken'].join('/'),
        auth: {
          user: @username,
          password: @password
        }
      )

      @access_token = response.body['access_token'] if response.code == 200
    end
  end
end
