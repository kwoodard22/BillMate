module InvoicesHelper

  def limit_to_current_month
    @month_invoices = []
    @invoices.each do |invoice|
      if invoice.invoice_period.strftime("%B %Y") == Date.today.strftime("%B %Y")
        @month_invoices << invoice
      end
    end
    @month_invoices
  end


end
