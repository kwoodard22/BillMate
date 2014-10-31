class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  respond_to(:html, :json)
  
  def index
    @invoices = current_user.house.invoices
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path, notice: "Invoice was successfully updated."
    else
      render :new
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoices_path, notice: "Invoice was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:date_paid, :expense_category_id, :amount, :comment, :invoice_period,
        payments_attributes: [:id, :invoice_id, :roommate_id])
    end
end
