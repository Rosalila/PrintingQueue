class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(thing_params)

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pickup

    @thing = get_thing_by_name params[:thing_name]

    @thing.ready_for_pickup_amount -= params[:amount].to_i
    @thing.save

    @pickup_log = PickupLog.new
    @pickup_log.user_id = current_user.id
    @pickup_log.thing_id = @thing.id
    @pickup_log.amount = params[:amount].to_i
    @pickup_log.save

    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def print

    @thing = get_thing_by_name params[:thing_name]

    @thing.ready_for_pickup_amount += params[:amount].to_i
    @thing.save

    @print_log = PrintLog.new
    @print_log.user_id = current_user.id
    @print_log.thing_id = @thing.id
    @print_log.amount = params[:amount].to_i
    @print_log.save

    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def print_form
  end

  def pickup_form
  end

  private
    def get_thing_by_name name
      @thing = Thing.find_by_name(name)
      if !@thing
        @thing = Thing.new
        @thing.name = name
        @thing.ready_for_pickup_amount = 0
        @thing.save
      end
      return @thing
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :ready_for_pickup_amount)
    end
end
