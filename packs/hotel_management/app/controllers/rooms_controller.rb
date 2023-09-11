class RoomsController < AdminController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :set_hotel
  before_action :load_data

  # GET /rooms or /rooms.json
  def index
    @rooms = @hotel.rooms
    @room = Room.new(hotel_id: @hotel.id)
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @room.hotel = @hotel
    respond_to do |format|
      if @room.save
        format.html { redirect_to hotel_rooms_url(@hotel), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to hotel_rooms_url(@hotel), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to hotel_rooms_url(@hotel), notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def load_data
      @room_types = @hotel.room_types.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(
        :room_name, 
        :rom_number, 
        :room_type, 
        :room_price, 
        :bathroom_count, 
        :bed_count, 
        :room_description, 
        :hotel_id,
        :room_type_id, 
        :room_max_occupancy, 
        :max_adults_allowed, 
        :max_children_allowed
      )
    end
end
