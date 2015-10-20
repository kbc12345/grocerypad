require 'google/api_client'

class Oauth::GoogleAuthenticator

  attr_accessor :client_id, :client_sercret, :code, :redirectUri, :access_token,
                :access_token, :token_credential_uri, :authorization_code

  def initialize(opts)
    @client_id      = Figaro.env.google_client_id
    @client_sercret = Figaro.env.google_client_sercret
    @code           = opts[:code]
    @redirectUri    = opts[:redirectUri]
    @token_credential_uri = Figaro.env.google_credential_uri
    @access_token   = authorize['access_token']
  end

  def fetch_user
    response  = HTTParty.get("#{Figaro.env.google_user_info_uri}#{@access_token}")
    body = response.symbolize_keys!
    body.merge(access_token: @access_token)
  end


  private


  def client
    Google::APIClient.new(
     application_name: "grocerypad",
     application_version: "1.0"
   )
  end

  def headers
    Signet::OAuth2::Client.new({
      client_id:            @client_id,
      client_secret:        @client_sercret,
      code:                 @code,
      token_credential_uri: @token_credential_uri
    })
  end

  def authorize
    _client = client
    _client.authorization = headers

    _client.authorization.grant_type = authorization_code
    _client.authorization.redirect_uri = @redirectUri

    _client.authorization.fetch_access_token!
  end

  def authorization_code
    'authorization_code'
  end

end
