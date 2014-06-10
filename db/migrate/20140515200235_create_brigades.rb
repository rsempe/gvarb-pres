class CreateBrigades < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.string :name, null: :false
      t.text :description, null: :false
      t.hstore :name_translations
      t.hstore :description_translations
      t.timestamps
    end

    add_index :brigades, :name_translations, using: :gin
    add_index :brigades, :description_translations, using: :gin
  end
end
