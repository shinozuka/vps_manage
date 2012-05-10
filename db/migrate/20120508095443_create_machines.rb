class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :cpu
      t.string :memory
      t.text :note

      t.timestamps
    end
  end
end
