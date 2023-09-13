class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy update_guest_info final_step reserved ]
  before_action :set_hotel, only: %i[ show edit update destroy update_guest_info final_step reserved ]
  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # # GET /reservations/new
  # def new
  #   @reservation = Reservation.new
  # end

  # # GET /reservations/1/edit
  # def edit
  # end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = 'pending'
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update_guest_info
    actor = Reservations::UpdateGuestInfo.result(
      reservation: @reservation, 
      guest_email: params[:reservation][:email], 
      guest_first_name: params[:reservation][:first_name], 
      guest_last_name: params[:reservation][:last_name],
      guest_phone: params[:reservation][:phone], 
      guest_age: params[:reservation][:age]
    )

    respond_to do |format|
      if actor.success? 
        format.html { redirect_to final_step_reservation_url(@reservation), notice: "Reservation was successfully updated guest info." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def final_step 
  end 

  def reserved
    actor = Reservations::Booking.call(reservation: @reservation)

    respond_to do |format|
      if actor.success? 
        format.html { redirect_to final_step_reservation_url(@reservation), notice: "Reservation was confirmed. We'll be sending booking information to your enails" }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /reservations/1 or /reservations/1.json
  # def destroy
  #   @reservation.destroy

  #   respond_to do |format|
  #     format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_hotel
      @hotel = HotelRepository.find_id(@reservation.hotel_id)
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.permit(:room_type_id, :check_out_date, :check_in_date, :guest_name, :guest_id, :hotel_id, :number_room)
    end
end
