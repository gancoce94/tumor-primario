class AddNameEmailToTumors < ActiveRecord::Migration
  def change
    add_column :tumors, :name, :string
    add_column :tumors, :email, :string
  end
end
