class BloodsugarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bloodsugar, only: [:show, :edit, :update, :destroy]

  # GET /bloodsugars
  # GET /bloodsugars.json
  def index
    @bloodsugars = Bloodsugar.all.page(params[:page]).per(3)
  end

  # GET /bloodsugars/1
  # GET /bloodsugars/1.json
  def show
  end

  # GET /bloodsugars/new
  def new
    @bloodsugar = Bloodsugar.new
  end

  # GET /bloodsugars/1/edit
  def edit
  end

  # POST /bloodsugars
  # POST /bloodsugars.json
  def create
    @bloodsugar = Bloodsugar.new(bloodsugar_params)

    respond_to do |format|
      if @bloodsugar.save
        format.html { redirect_to @bloodsugar, notice: 'Bloodsugar was successfully created.' }
        format.json { render :show, status: :created, location: @bloodsugar }
      else
        format.html { render :new }
        format.json { render json: @bloodsugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bloodsugars/1
  # PATCH/PUT /bloodsugars/1.json
  def update
    respond_to do |format|
      if @bloodsugar.update(bloodsugar_params)
        format.html { redirect_to @bloodsugar, notice: 'Bloodsugar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bloodsugar }
      else
        format.html { render :edit }
        format.json { render json: @bloodsugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bloodsugars/1
  # DELETE /bloodsugars/1.json
  def destroy
    @bloodsugar.destroy
    respond_to do |format|
      format.html { redirect_to bloodsugars_url, notice: 'Bloodsugar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloodsugar
      @bloodsugar = Bloodsugar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bloodsugar_params
      params.require(:bloodsugar).permit(:date, :fasting, :nonfasting)
    end
end