class CreateHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :helpers do |t|
      t.string :name
      t.string :alias
      t.integer :age
      t.integer :years_of_experience
      t.integer :rating
      t.integer :rates
      t.text :speciality
      t.string :picture

      t.timestamps
    end
  end
end
