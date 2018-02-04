class Order < ActiveRecord::Base
 has_many :items
 belongs_to :client
 belongs_to :user
end
