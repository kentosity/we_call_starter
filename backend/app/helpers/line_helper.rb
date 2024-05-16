require 'httpclient'
require 'line/bot'

module LineHelper
    # line botに設定
    def get_line_bot_client
        Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
    end

    # https://developers.line.biz/ja/docs/line-login/managing-users/#get-profile
    def get_profile_from_access_token(lineAccessToken)
        url = "https://api.line.me/v2/profile"
        header = { Authorization: "Bearer #{lineAccessToken}" }

        client = HTTPClient.new
        response = client.get(url, header: header)
        jsoned_body = JSON.parse(response.body)

        return jsoned_body['userId']
    end 

    
end