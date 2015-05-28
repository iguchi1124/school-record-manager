class AddPasswordDigestToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :password_digest, :string
  end
end
