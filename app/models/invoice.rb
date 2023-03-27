class Invoice < ApplicationRecord
    belongs_to :user
    has_many  :invoice_item, dependent: :destroy
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5}
end
