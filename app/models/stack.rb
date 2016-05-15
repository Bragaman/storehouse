class Stack < ActiveRecord::Base
  belongs_to :room
  has_many :products
  validates :room_id, presence: true
  validates :place_width, :place_height, :place_length, :max_total_load, presence: true, numericality: {only_float: true}
  validates :number,  :place_count, presence: true, numericality: {only_integer: true}
end
