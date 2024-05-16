require 'line/bot'

class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)

    fullname = "#{@entry.surname} #{@entry.name}"
    message = {
      type: 'text',
      text: "#{fullname}様\n\nお問い合わせを受け付けました!"
    }

    if @entry.save
      # uid を使用してメッセージを送信
      response = line_client.push_message(@entry.uid, message)
      logger.debug(response)
      render status: :created, json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end

  end

  private
    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:uid, :surname, :name, :surnameKana, :nameKana, :gender, :birthday, :prefecture, :address, :email)
    end

    # line botに設定
    def line_client
      Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
    end 
end
