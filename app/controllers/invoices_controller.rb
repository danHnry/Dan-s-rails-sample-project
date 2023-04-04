class InvoicesController < ApplicationController

  def index
    @invoices = current_user.invoices.all
  end

  def show
    @invoice = current_user.invoices.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.token = SecureRandom.uuid
    @invoice.user = current_user
    if @invoice.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @invoice
    else
      render :new, status: :unprocessable_entity
    end
   end

 def edit
  @invoice = current_user.invoices.find(params[:id])
 end

 def update
  @invoice = current_user.invoices.find(params[:id])

  if @invoice.update(invoice_params)
    redirect_to @invoice
  else
    render :edit, status: :unprocessable_entity
  end
 end

 def view
  @invoice = Invoice.find_by(token: params[:token])
  render :show 
end

 def destroy
  @invoice = current_user.invoices.find(params[:id])
  @invoice.destroy

  redirect_to root_path, status: :see_other
 end


   private
    def invoice_params
      params.require(:invoice).permit(:name, :description)
    end
end
