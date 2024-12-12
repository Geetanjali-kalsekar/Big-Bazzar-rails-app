class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def show
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path(current_user), notice: "Address created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to address_path(current_user), notice: "Address updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_addresses_path(@user), notice: "Address deleted successfully."
  end

  private

  def set_address
    @address = current_user.addresses.find_by(id: params[:id])
    if @address.nil?
      redirect_to user_addresses_path(@user), alert: "Address not found."
    end
  end

  def address_params
    params.require(:address).permit(:colony, :city, :pincode, :country)
  end
end
