class Project < ActiveRecord::Base
  has_many :virtual_environment_has_projects
  has_many :virtual_environments, :through => :virtual_environment_has_projects

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessible :name, :note

  def self.per_page
    10
  end
end
