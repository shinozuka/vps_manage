class CreateVirtualEnvironmentHasProjects < ActiveRecord::Migration
  def change
    create_table :virtual_environment_has_projects do |t|
      t.integer :virtual_environment_id
      t.integer :project_id

      t.timestamps
    end
  end
end
