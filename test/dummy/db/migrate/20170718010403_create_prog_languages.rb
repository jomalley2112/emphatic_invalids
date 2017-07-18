class CreateProgLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :prog_languages do |t|
      t.string :name
    end
  end
end
