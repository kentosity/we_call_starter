require 'json'
include LineHelper

class EntriesController < ApplicationController
  before_action :validate_user, only: [:create, :update, :destroy]
  before_action :find_entry_by_recepient_id, only: [:show, :update, :destroy]

  def show
    if @entry.nil?
      render json: { error: 'Entry with the given access_token was not found' }, status: :not_found
      return
    end

    render json: @entry, status: :ok
  end

  def create
    @entry = Entry.new(entry_params.merge(uid: @line_recepient_id))
    

    begin
      @entry.save!
      notify_user_of_change(@entry)
      render json: @entry, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
      render json: invalid.record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @entry.nil?
      render json: { error: 'You haven\'t created an entry yet!' }
      return
    end

    if @entry.update(entry_params)
      render json: @entry, status: :ok
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @entry.nil?
      render json: { error: 'Entry not found' }, status: :not_found
      return
    end

    if @entry.uid != @line_recepient_id
      render json: { error: 'You are not authorized to delete this entry' }, status: :forbidden
      return
    end

    if @entry.destroy
      render json: { message: 'Entry deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete the entry' }, status: :unprocessable_entity
    end
  end


  private
    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:surname, :name, :surnameKana, :nameKana, :gender, :birthday, :prefecture, :address, :email)
    end

    def validate_user
      access_token = params[:access_token]
      if access_token.nil?
        render json: { error: 'Access token needed' }, status: :not_found 
        return
      end
      
      @line_recepient_id = get_user_id_from_access_token(access_token)

      if @line_recepient_id.nil?
        render json: { error: 'Failed to retrieve line id from the access token provided' }, status: :unprocessable_entity
        return
      end
    end

    def find_entry_by_recepient_id
      @entry = Entry.find_by(uid: @line_recepient_id)
    end

    def notify_user_of_change(json_data)
      fullname = "#{json_data.surname} #{json_data.name}"
      entry_attributes = json_data.attributes.slice('id', 'surname', 'name', 'surnameKana', 'nameKana', 'gender', 'birthday', 'prefecture', 'address', 'email')
      entry_string = entry_attributes.map { |key, value| "#{key}: #{value}" }.join("\n")
      message = {
        type: 'text',
        text: "#{fullname}様に新しいお知らせです。\nお問い合わせを受け付けました!\n\n#{entry_string}"
      }
  
      line_client = get_line_bot_client
      response = line_client.push_message(@line_recepient_id, message)
    end
end
