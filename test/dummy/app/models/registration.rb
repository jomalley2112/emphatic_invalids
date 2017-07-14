class Registration < ApplicationRecord
	validates :first_name, :last_name, :email, :sex, :prog_languages, :favorite_color, presence: true
	validates :age, numericality: { greater_than_or_equal_to: 21 }
	validates :accept_terms, acceptance: true
end
