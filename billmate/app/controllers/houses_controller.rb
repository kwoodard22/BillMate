class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user_id = current_user.id

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'Successfully created house profile.' }
      else
        format.html { render :new, notice: 'Creating house profile failed.' }
      end
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.update_attributes(house_params)
      redirect_to @house, notice: "Successfully updated house profile."
    else
      render :edit
    end
  end

  def destroy
    @house = House.find(params[:id])
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

