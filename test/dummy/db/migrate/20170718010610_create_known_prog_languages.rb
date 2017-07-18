class CreateKnownProgLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :known_prog_languages do |t|
      t.integer :registration_id
      t.integer :prog_language_id
    end
  end
end
