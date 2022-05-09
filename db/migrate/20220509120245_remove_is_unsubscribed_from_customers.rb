class RemoveIsUnsubscribedFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :is_unsubscribed, :boolean
  end
end
