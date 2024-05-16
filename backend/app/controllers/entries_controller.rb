include LineHelper

class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)

    fullname = "#{@entry.surname} #{@entry.name}"
    message = {
      type: 'text',
      text: "#{fullname}様\n\nお問い合わせを受け付けました!"
    }

    if @entry.save!
      render json: @entry.errors, status: :unprocessable_entity and return
    end

    
    line_client = get_line_bot_client
    line_recepient_id = get_profile_from_access_token(@entry.uid)
    response = line_client.push_message(line_recepient_id, message)

    render status: :created, json: @entry
  end

  private
    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:uid, :surname, :name, :surnameKana, :nameKana, :gender, :birthday, :prefecture, :address, :email)
    end
end
