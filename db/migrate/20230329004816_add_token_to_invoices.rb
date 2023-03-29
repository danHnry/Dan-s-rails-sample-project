class AddTokenToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :token, :string
  end
end
