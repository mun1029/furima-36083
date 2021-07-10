class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :delivery_id 
    validates :area_id      
    validates :delivery_day_id
    validates :status_id
  end
end
