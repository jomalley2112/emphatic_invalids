class RemoveColumnProgLanguagesFromRegistrations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :registrations, :prog_languages, :string
  end
end
