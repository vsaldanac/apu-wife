class BreastfeedingsController < ApplicationController
  before_action :set_breastfeeding, only: [:show, :edit, :update, :destroy]
  before_action :set_babies, only: [:new, :edit, :create]


  # GET /breastfeedings
  # GET /breastfeedings.json
  def index
    @breastfeedings = Breastfeeding.all
  end

  # GET /breastfeedings/1
  # GET /breastfeedings/1.json
  def show
  end

  # GET /breastfeedings/new
  def new
    @breastfeeding = Breastfeeding.new
  end

  # GET /breastfeedings/1/edit
  def edit
  end

  # POST /breastfeedings
  # POST /breastfeedings.json
  def create
    @breastfeeding = Breastfeeding.new(breastfeeding_params)

    respond_to do |format|
      if @breastfeeding.save
        format.html { redirect_to @breastfeeding, notice: 'Breastfeeding was successfully created.' }
        format.json { render :show, status: :created, location: @breastfeeding }
      else
        format.html { render :new }
        format.json { render json: @breastfeeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breastfeedings/1
  # PATCH/PUT /breastfeedings/1.json
  def update
    respond_to do |format|
      if @breastfeeding.update(breastfeeding_params)
        format.html { redirect_to @breastfeeding, notice: 'Breastfeeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @breastfeeding }
      else
        format.html { render :edit }
        format.json { render json: @breastfeeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breastfeedings/1
  # DELETE /breastfeedings/1.json
  def destroy
    @breastfeeding.destroy
    respond_to do |format|
      format.html { redirect_to breastfeedings_url, notice: 'Breastfeeding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breastfeeding
      @breastfeeding = Breastfeeding.find(params[:id])
    end

    def set_babies
      @babies_array = Baby.order(:name).pluck(:name,:id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breastfeeding_params
      params.require(:breastfeeding).permit(:volume, :feed_time, :baby_id)
    end
end
