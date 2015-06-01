class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.references :klass, index: true, foreign_key: true
      t.string :name
      t.string :teacher_name

      t.timestamps null: false
    end
  end
end
