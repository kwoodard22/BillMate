class RoommatesController < ApplicationController

  def index
    @roommates = Roommate.all
  end

  def new
    @roommate = Roommate.new
  end

  def create
    @roommate = Roommate.new(roommate_params)
    @roommate.house_id = current_user.house.id

    respond_to do |format|
      if @roommate.save
        format.html { redirect_to new_expense_category_path, notice: 'Roommates profile was successfully created.' }
      else
        format.html { render :new, notice: 'Creating roommates profile failed.' }
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
    @roommate = Roommate.find(params[:id])
    if @roommate.destroy
      redirect_to edit_house_path(current_user.house.id), notice: "Roommate profile successfully destroyed."  # this essentially redirects to our index page
    else
      render :show
    end
  end


  private

    def roommate_params
      params.require(:roommate).permit(:name, :email)
    end

end

