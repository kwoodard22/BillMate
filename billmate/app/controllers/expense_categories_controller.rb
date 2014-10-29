class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]

  def index
    @expense_categories = ExpenseCategory.all
  end

  def show
  end

  def new
    @expense_category = ExpenseCategory.new
  end

  def edit
  end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.house_id = current_user.house.id

    respond_to do |format|
      if @expense_category.save
    
        format.html { redirect_to edit_house_path(current_user.house), notice: 'Successfully created expense category.' }
      else
        format.html { render :new, notice: 'Creating expense category failed.' }
      end
    end
  end

  def update
    @expense_category.update(expense_category_params)
  end

  def destroy
    @expense_category = ExpenseCategory.find(params[:id])
    if @expense_category.destroy
      redirect_to edit_house_path(current_user.house.id), notice: "Expense category successfully destroyed."  # this essentially redirects to our index page
    else
      render :show
    end
  end

  private
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    def expense_category_params
      params.require(:expense_category).permit(:name, :account_number, :phone, :autopay, :comments, :utility, :house_id)
    end
end
