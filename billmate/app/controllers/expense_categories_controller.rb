class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]

  def index
    @expense_categories = ExpenseCategory.all
    respond_with(@expense_categories)
  end

  def show
    respond_with(@expense_category)
  end

  def new
    @expense_category = ExpenseCategory.new
    respond_with(@expense_category)
  end

  def edit
  end

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.save
    respond_with(@expense_category)
  end

  def update
    @expense_category.update(expense_category_params)
    respond_with(@expense_category)
  end

  def destroy
    @expense_category.destroy
    respond_with(@expense_category)
  end

  private
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    def expense_category_params
      params.require(:expense_category).permit(:name, :account_number, :phone, :autopay, :comments, :utility, :house_id)
    end
end
