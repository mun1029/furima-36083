class Product < ApplicationRecord
  belongs_to :user

  validates :user,            presence: true
  validates :name,            presence: true
  validates :description,     presence: true
  validates :category_id,     presence: true
  validates :delivery_id,     presence: true
  validates :area_id,         presence: true
  validates :delivery_day_id, presence: true
  validates :status_id,       presence: true
  validates :price,           presence: true
end
