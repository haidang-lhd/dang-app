class AddFullNameToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :full_name, :string
    add_column :clients, :secondary_id, :integer
  end
end
