class PickedThingsController < ApplicationController
  before_action :set_picked_thing, only: [:show, :edit, :update, :destroy]

  # GET /picked_things
  # GET /picked_things.json
  def index
    @picked_things = PickedThing.all
  end

  # GET /picked_things/1
  # GET /picked_things/1.json
  def show
  end

  # GET /picked_things/new
  def new
    @picked_thing = PickedThing.new
  end

  # GET /picked_things/1/edit
  def edit
  end

  # POST /picked_things
  # POST /picked_things.json
  def create
    @picked_thing = PickedThing.new(picked_thing_params)

    respond_to do |format|
      if @picked_thing.save
        format.html { redirect_to @picked_thing, notice: 'Picked thing was successfully created.' }
        format.json { render :show, status: :created, location: @picked_thing }
      else
        format.html { render :new }
        format.json { render json: @picked_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picked_things/1
  # PATCH/PUT /picked_things/1.json
  def update
    respond_to do |format|
      if @picked_thing.update(picked_thing_params)
        format.html { redirect_to @picked_thing, notice: 'Picked thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @picked_thing }
      else
        format.html { render :edit }
        format.json { render json: @picked_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picked_things/1
  # DELETE /picked_things/1.json
  def destroy
    @picked_thing.destroy
    respond_to do |format|
      format.html { redirect_to picked_things_url, notice: 'Picked thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picked_thing
      @picked_thing = PickedThing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picked_thing_params
      params.require(:picked_thing).permit(:user_id, :thing_id)
    end
end
