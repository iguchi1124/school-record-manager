class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.integer :school_id
      t.string :password

      t.timestamps null: false
    end
  end
end
