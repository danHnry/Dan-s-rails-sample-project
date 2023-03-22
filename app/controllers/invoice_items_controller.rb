class InvoiceItemsController < ApplicationController
  
  http_basic_authenticate_with name: "dan", password: "pass1234", only: :destroy

  def create
        @invoice = Invoice.find(params[:invoice_id])
        @invoice_item = @invoice.invoice_item.create(invoice_item_params)
        redirect_to invoice_path(@invoice)
    end

    def destroy
      @invoice = Invoice.find(params[:invoice_id])
      @invoice_item = @invoice.invoice_item.find(params[:id])
      @invoice_item.destroy
      redirect_to invoice_path(@invoice), status: :see_other
    end

    private
      def invoice_item_params
        params.require(:invoice_item).permit(:itemName)
      end
end