class AddDetailsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_kana, :string
    add_column :customers, :last_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :tel_number, :string
    add_column :customers, :is_unsubscribed, :boolean
  end
end
