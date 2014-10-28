class HousesController < ApplicationController
  # before_action :set_house, only: [:show, :edit, :update, :destroy, :roommates]
  # Took the above from another tutorial and not sure if needed.
  
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user_id = current_user.id

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House profile was successfully created.' }
      else
        format.html { render :new, notice: 'Creating house profile failed.' }
      end
    end
  end

  def show
    @house = House.find(params[:id])
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    if @house.update(house_params)
      redirect_to @house, notice: "House profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy

    if @house.destroy
      redirect_to root_path, notice: "House profile successfully destroyed."  # this essentially redirects to our index page
    else
      render :show
    end
  end


  private

    def house_params
      params.require(:house).permit(:name, :user_id,
        roommates_attributes: [:name, :email, :_destroy])
    end

end

