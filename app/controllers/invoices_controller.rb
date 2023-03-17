class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to @invoice
    else
      render :new, status: :unprocessable_entity
    end
 end

 def edit
  @invoice = Invoice.find(params[:id])
 end

 def update
  @invoice = Invoice.find(params[:id])

  if @invoice.update(invoice_params)
    redirect_to @invoice
  else
    render :edit, status: :unprocessable_entity
  end
 end

 def destroy
  @invoice = Invoice.find(params[:id])
  @invoice.destroy

  redirect_to root_path, status: :see_other
end


   private
    def invoice_params
      params.require(:invoice).permit(:name, :description)
    end
end
