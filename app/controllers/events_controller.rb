class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @location = Location.find(params[:location_id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @location = Location.find(params[:location_id])
    @event = Event.new(event_params)


      if @event.save
        redirect_to location_event_path(@location, @event), notice: "Event was successfully created."
      else
       render :new
      end
    end


  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json


  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to location_event_path, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json


    def destroy
      @event = Event.find(params[:id])
      @event.destroy
    respond_to do |format|
      format.html { redirect_to locations_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :date, :requires_id, :location_id)
    end
end
