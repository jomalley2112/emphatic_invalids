class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.integer :age
      t.date :date_of_birth

      t.timestamps
    end
  end
end
