class Order < ActiveRecord::Base
  has_many :items, through: :order_items
  has_many :order_items
  belongs_to :user
  belongs_to :client
end
