class Address < ApplicationRecord
	belongs_to :registration
	validates :street, :city, :state, :zip, presence: true
	has_one :county
	accepts_nested_attributes_for :county

end