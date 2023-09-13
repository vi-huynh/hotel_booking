class CancellationsController < ApplicationController
  before_action :set_cancellation, only: %i[ show edit update destroy ]

  # GET /cancellations or /cancellations.json
  def index
    @search_form = SearchBookingForm.new(
      booking_number: params[:booking_number], 
      guest_email: params[:guest_email]
    )

    actor = SearchBooking.result(
      search_form: @search_form
    )
    @reservation = actor.reservation
    @cancellation = Cancellation.new(reservation: @reservation)

  end

  # GET /cancellations/1 or /cancellations/1.json
  def show
  end

  # GET /cancellations/new
  def new
    @cancellation = Cancellation.new
  end

  # GET /cancellations/1/edit
  def edit
  end

  # POST /cancellations or /cancellations.json
  def create
    @cancellation = Cancellation.new(cancellation_params)

    respond_to do |format|
      if @cancellation.save
        format.html { redirect_to cancellation_url(@cancellation), notice: "Cancellation was successfully created." }
        format.json { render :show, status: :created, location: @cancellation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cancellations/1 or /cancellations/1.json
  def update
    respond_to do |format|
      if @cancellation.update(cancellation_params)
        format.html { redirect_to cancellation_url(@cancellation), notice: "Cancellation was successfully updated." }
        format.json { render :show, status: :ok, location: @cancellation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cancellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cancellations/1 or /cancellations/1.json
  def destroy
    @cancellation.destroy

    respond_to do |format|
      format.html { redirect_to cancellations_url, notice: "Cancellation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cancellation
      @cancellation = Cancellation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cancellation_params
      params.require(:cancellation).permit(:reason, :cancelled_at)
    end
end
