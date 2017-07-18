class ProgLanguage < ApplicationRecord
	has_many :known_prog_languages
	has_many :registrations, -> { distinct }, through: :known_prog_languages

	validates :name, presence: true
end