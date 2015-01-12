module InvoicesHelper

  def invoice_month
    @this_month = Date.today.strftime("%B %Y")
    @this_month
  end

  def limit_to_current_month
    @month_invoices = []
    @invoices.each do |invoice|
      if invoice.invoice_period.strftime("%B %Y") == invoice_month
        @month_invoices << invoice
      end
    end
    @month_invoices
  end


end
