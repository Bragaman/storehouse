class Room < ActiveRecord::Base
	has_many :stacks

  validates :volume, presence: true, numericality: {only_float: true, greater_than: 0}
end
