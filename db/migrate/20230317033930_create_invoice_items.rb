class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.string :itemName
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
