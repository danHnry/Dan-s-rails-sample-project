class Invoice < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 5}
end
