class AddContactAndExpiredAtToVirtualEnvironments < ActiveRecord::Migration
  def change
    add_column :virtual_environments, :contact, :text
    add_column :virtual_environments, :expired_at, :timestamp
  end
end
