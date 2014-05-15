class CreateBrigades < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.string :name, null: :false
      t.text :description, null: :false

      t.timestamps
    end
  end
end
