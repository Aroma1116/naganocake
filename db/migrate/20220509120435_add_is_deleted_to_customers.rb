class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_unsubscribed, :boolean, default: false
  end
end
