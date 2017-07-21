class Address < ApplicationRecord
	belongs_to :registration

	validates :street, :city, :state, :zip, presence: true

end