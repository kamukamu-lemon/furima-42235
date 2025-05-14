class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :address
  belongs_to :item
  belongs_to :user
  belongs_to :prefecture
end
