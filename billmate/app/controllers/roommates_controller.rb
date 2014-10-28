class RoommatesController < ApplicationController

  def index
    @roommates = Roommate.all
  end

  def new
    @roommate = Roommate.new
  end

  def create
    @roommate = Roommate.new(house_params)
    @roommate.user_id = current_user.id

    respond_to do |format|
      if @roommate.save
        format.html { notice: 'Roommates profile was successfully created.' }
      else
        format.html { notice: 'Creating roommates profile failed.' }
      end
    end
  end

  def show
    @roommate = Roommate.find(params[:id])
  end

  def edit
    @roommate = Roommate.find(params[:id])
  end

  def update
    if @roommate.update(roommate_params)
      redirect_to @roommate, notice: "Roommate profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy

    if @roommate.destroy
      redirect_to root_path, notice: "Roommate profile successfully destroyed."  # this essentially redirects to our index page
    else
      render :show
    end
  end


  private

    def roommate_params
      params.require(:roommate).permit(:name, :email)
    end

end

