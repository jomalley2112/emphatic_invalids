class AddColsToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :accept_terms, :boolean, default: false
    add_column :registrations, :sex, :string
    add_column :registrations, :favorite_color, :string
    add_column :registrations, :prog_languages, :string
  end
end
