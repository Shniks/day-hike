class CreateTrail < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :address
      t.decimal :length

      t.timestamps
    end
  end
end
