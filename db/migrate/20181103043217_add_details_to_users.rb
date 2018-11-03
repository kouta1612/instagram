class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :web_site, :string
    add_column :users, :self_introduction, :string
    add_column :users, :sex, :string
  end
end
