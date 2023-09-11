class RoomTypesController < AdminController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :set_hotel
  before_action :load_data

  # GET /rooms or /rooms.json
  def index
    @room_types = @hotel.room_types
    @room_type = RoomType.new(hotel_id: @hotel.id)
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room_type = RoomType.new(room_type_params)
    @room_type.hotel = @hotel
    respond_to do |format|
      if @room_type.save
        format.html { redirect_to hotel_room_types_url(@hotel), notice: "Room type was successfully created." }
        format.json { render :show, status: :created, location: @room_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room_type.update(room_type_params)
        format.html { redirect_to hotel_room_types_url(@hotel), notice: "Room type was successfully updated." }
        format.json { render :show, status: :ok, location: @room_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room_type_type.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room_type = RoomType.find(params[:id])
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def load_data
      @room_type_types = @hotel.room_types
    end

    # Only allow a list of trusted parameters through.
    def room_type_params
      params.require(:room_type).permit(:name, :price, :hotel_id)
    end
end
