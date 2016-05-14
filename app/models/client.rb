class Client < ActiveRecord::Base
	validates :entity_name, presence: true
	validates :bank_details, presence: true
end
