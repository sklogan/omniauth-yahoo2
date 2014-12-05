require 'omniauth/strategies/oauth2'
require 'base64'
require 'openssl'
require 'rack/utils'
require 'uri'
require 'multi_json'

module OmniAuth
  module Strategies
    class Yahoo < OmniAuth::Strategies::OAuth2
	include OmniAuth::Strategy

      option :name, 'yahoo'

      option :client_options, {
          :site          => 'https://api.login.yahoo.com',
          :authorize_url => '/oauth2/request_auth',
          :token_url     => '/oauth2/get_token'
      }

      uid {
        access_token.params['xoauth_yahoo_guid']
      }

      info do
        primary_email = nil
        if user_info['emails']
          email_info    = user_info['emails'].find{|e| e['primary']} || user_info['emails'].first
          primary_email = email_info['handle']
        end
        {
            :nickname    => user_info['nickname'],
            :name        => user_info['givenName'] || user_info['nickname'],
            :image       => user_info['image']['imageUrl'],
            :description => user_info['message'],
            :email       => primary_email,
            :urls        => {
                'Profile' => user_info['profileUrl'],
            }
        }
      end

      extra do
        hash = {}
        hash[:raw_info] = raw_info unless skip_info?
        hash
      end

      # Return info gathered from the v1/user/:id/profile API call

      def raw_info
        # This is a public API and does not need signing or authentication
        request = "https://social.yahooapis.com/v1/user/#{uid}/profile?format=json"
        @raw_info ||= MultiJson.decode(access_token.get(request).body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # Provide the "Profile" portion of the raw_info

      def user_info
        @user_info ||= raw_info.nil? ? {} : raw_info["profile"]
      end
    end
  end
end
