class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show update destroy ]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
    render status: 200, json: @entries
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render status: :created, json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    if @entry.update(entry_params)
      render :show, status: :ok, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:surname, :name, :surnameKana, :nameKana, :gender, :birthday, :prefecture, :address, :email)
    end
end
