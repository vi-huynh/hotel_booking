class HotelsController < AdminController
  
  before_action :authenticate_admin!
  before_action :set_hotel, only: %i[ show edit update destroy ]
  before_action :load_data, only: %i[index]

  load_and_authorize_resource 
  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.all
    @hotel = Hotel.new
  end

  # GET /hotels/1 or /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @user_clients = User.all.pluck(:username, :id)
  end

  # GET /hotels/1/edit
  def edit
    @user_clients = User.all.pluck(:username, :id)
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
    @user_clients = User.all.pluck(:username, :id)
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotels_url, notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotels_url, notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def load_data
      @user_owners = User.joins(:roles).where(roles: {name: 'hotel_owner'}).pluck('users.username, users.id')
    end 
    
    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(
        :name, 
        :email, 
        :address, 
        :city,
        :state,
        :country,
        :contact, 
        :phone,
        :description, 
        :user_id)
    end
end
