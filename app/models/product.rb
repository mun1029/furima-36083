class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :user
  has_one    :order
  has_many   :comments

  has_one_attached :image

  

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
  format: { with: /\A[0-9]+\z/, message: '半角数値を使用してください' }

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :delivery_id 
    validates :area_id      
    validates :delivery_day_id
    validates :status_id
  end
end