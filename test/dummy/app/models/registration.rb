class Registration < ApplicationRecord
	has_many :known_prog_languages
	has_many :prog_languages, -> { distinct }, through: :known_prog_languages

	validates :first_name, :last_name, :email, :sex, :known_prog_language_ids, presence: true #:favorite_color,
	validates :age, numericality: { greater_than_or_equal_to: 21 }
	validates :accept_terms, acceptance: true
end
