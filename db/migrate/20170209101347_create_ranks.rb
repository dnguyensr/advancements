class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.string :rank
      t.date :completed
      t.integer :advancement_id

      t.timestamps
    end
  end
end
