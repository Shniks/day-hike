class CreateTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name

      t.timestamps
    end
  end
end
