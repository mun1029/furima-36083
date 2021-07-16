class Order < ApplicationRecord
  has_one :sipping
  belongs_to :user
  belongs_to :product
end
