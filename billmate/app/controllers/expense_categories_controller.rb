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

    respond_to do |format|
      if @expense_category.save
        binding.pry
        format.html { redirect_to edit_house_path(@user.house.id), notice: 'Successfully created expense category.' }
      else
        format.html { render :new, notice: 'Creating expense category failed.' }
      end
    end
  end

  def update
    @expense_category.update(expense_category_params)
  end

  def destroy
    @expense_category.destroy
  end

  private
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    def expense_category_params
      params.require(:expense_category).permit(:name, :account_number, :phone, :autopay, :comments, :utility, :house_id)
    end
end
