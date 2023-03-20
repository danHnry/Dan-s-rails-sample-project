class InvoiceItemsController < ApplicationController
    def create
        @invoice = Invoice.find(params[:invoice_id])
        @invoice_item = @invoice.invoice_item.create(invoice_item_params)
        redirect_to invoice_path(@invoice)
    end

    private
      def invoice_item_params
        params.require(:invoice_item).permit(:itemName)
      end
end
