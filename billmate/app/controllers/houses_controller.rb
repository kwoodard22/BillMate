class HousesController < ApplicationController
  
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House profile was successfully created.' }
      else
        format.html { render :new, notice: 'Creating house profile failed.' }
      end
    end
  end

  def show
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

    def album_params
      params.require(:house).permit(:name)
    end

end

