class FinesController < ApplicationController
  require 'active_support/core_ext/date/calculations'

  before_action :set_fine, only: [:show, :edit, :update, :destroy]

  # GET /fines
  # GET /fines.json
  def index
    @fines = Fine.all
  end

  # GET /fines/1
  # GET /fines/1.json
  def show
  end

  # GET /fines/new
  def new
    @fine = Fine.new
  end

  # GET /fines/1/edit
  def edit
  end

  # POST /fines
  # POST /fines.json
  def create
    @fine = Fine.new(fine_params)

    respond_to do |format|
      if @fine.save
        format.html { redirect_to @fine, notice: 'Fine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fine }
      else
        format.html { render action: 'new' }
        format.json { render json: @fine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fines/1
  # PATCH/PUT /fines/1.json
  def update
    respond_to do |format|
      if @fine.update(fine_params)
        format.html { redirect_to @fine, notice: 'Fine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fines/1
  # DELETE /fines/1.json
  def destroy
    @fine.destroy
    respond_to do |format|
      format.html { redirect_to fines_url }
      format.json { head :no_content }
    end
  end

  # POST /fines/search
  def search
    params = Hash[search_parameters.map { |k,v| [k, k=='taken_at' ? [Date.parse(v)..Date.parse(v)+1.day] : v] }]

    @fines = Fine.where(params)
  end

  # GET /fines/search_form
  def search_form
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fine
      @fine = Fine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fine_params
      params.require(:fine).permit(:number, :plate, :taken_at, :amount)
    end

  def search_parameters
    params.permit(:number, :plate, :taken_at).select { |k,v| !v.blank? }
  end
end
