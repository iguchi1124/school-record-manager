class AddTermToRecords < ActiveRecord::Migration
  def change
    add_column :records, :term, :integer
  end
end
