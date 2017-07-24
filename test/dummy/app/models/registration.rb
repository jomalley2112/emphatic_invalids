class Registration < ApplicationRecord
	has_many :known_prog_languages
	has_many :prog_languages, -> { distinct }, through: :known_prog_languages
	
	

	validates :first_name, :last_name, :email, presence: true
	validates :age, numericality: { greater_than_or_equal_to: 21 }
	validate  :dob_in_past
	validates :sex, presence: true
	has_one :address
	accepts_nested_attributes_for :address
	validates :favorite_color, format: { without: /\A#(000000|FFFFFF)\z/i }
	validates :prog_language_ids, presence: true
	validates :accept_terms, acceptance: { accept: true }

	def kpl_selections
		known_prog_languages.pluck(:prog_language_id)
	end

	private
	def dob_in_past
		errors.add(:date_of_birth, "must be in the past")	unless date_of_birth < Time.now
	end
end
