class CreateSubrequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :subrequirements do |t|
      t.string :part
      t.text :description
      t.integer :requirement_id

      t.timestamps
    end
  end
end
