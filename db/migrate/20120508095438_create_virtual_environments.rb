class CreateVirtualEnvironments < ActiveRecord::Migration
  def change
    create_table :virtual_environments do |t|
      t.string :name
      t.integer :machine_id
      t.string :ip
      t.integer :tap
      t.string :mac
      t.integer :vnc
      t.string :image_name
      t.text :note

      t.timestamps
    end
  end
end
