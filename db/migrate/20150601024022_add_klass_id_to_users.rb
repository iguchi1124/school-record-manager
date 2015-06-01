class AddKlassIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :klass, index: true, foreign_key: true
  end
end
