class Product < ApplicationRecord
  has_many :delivery_details, dependent: :destroy
end
