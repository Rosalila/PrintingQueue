class OrderersController < ApplicationController
  before_action :set_orderer, only: [:show, :edit, :update, :destroy]

  # GET /orderers
  # GET /orderers.json
  def index
    @orderers = Orderer.all
  end

  # GET /orderers/1
  # GET /orderers/1.json
  def show
  end

  # GET /orderers/new
  def new
    @orderer = Orderer.new
  end

  # GET /orderers/1/edit
  def edit
  end

  # POST /orderers
  # POST /orderers.json
  def create
    @orderer = Orderer.new(orderer_params)

    respond_to do |format|
      if @orderer.save
        format.html { redirect_to @orderer, notice: 'Orderer was successfully created.' }
        format.json { render :show, status: :created, location: @orderer }
      else
        format.html { render :new }
        format.json { render json: @orderer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderers/1
  # PATCH/PUT /orderers/1.json
  def update
    respond_to do |format|
      if @orderer.update(orderer_params)
        format.html { redirect_to @orderer, notice: 'Orderer was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderer }
      else
        format.html { render :edit }
        format.json { render json: @orderer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderers/1
  # DELETE /orderers/1.json
  def destroy
    @orderer.destroy
    respond_to do |format|
      format.html { redirect_to orderers_url, notice: 'Orderer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderer
      @orderer = Orderer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderer_params
      params.require(:orderer).permit(:name)
    end
end
