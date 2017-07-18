class KnownProgLanguage < ApplicationRecord
	belongs_to :registration
	belongs_to :prog_language
end