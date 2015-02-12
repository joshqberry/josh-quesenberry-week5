class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @location = Location.find(params[:location_id])
    @events = @location.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @location = Location.find(params[:location_id])
    @events = @location.events
    @event = @events.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  # GET /events/1/edit
  def edit
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @location = Location.find(params[:location_id])
    @event = Event.new(event_params)
    @event.location_id = (params[:location_id])

      if @event.save
        redirect_to location_path(@location), notice: "Event was successfully created."
      else
       render :new
      end
    end


  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json


  def update
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
      if @event.update(event_params)
        redirect_to location_path(@location), notice: 'Event was successfully updated.'
      else
         render :edit
      end
    end


  # DELETE /events/1
  # DELETE /events/1.json


    def destroy
      @location = Location.find(params[:location_id])
      @events = @location.events
      @event = @events.find(params[:id])
      @event.destroy
      redirect_to location_path(@location), notice: 'Event was successfully destroyed.'
    end






  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :date, :requires_id, :location_id)
    end
end
