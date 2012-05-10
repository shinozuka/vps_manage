class VirtualEnvironmentHasProject < ActiveRecord::Base
  belongs_to :virtual_environment
  belongs_to :project

  attr_accessible :project_id, :virtual_environment_id
end
