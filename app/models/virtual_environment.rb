class VirtualEnvironment < ActiveRecord::Base
  belongs_to :machine
  has_many :virtual_environment_has_projects
  has_many :projects, :through => :virtual_environment_has_projects 

  validates_presence_of :name
  validates_uniqueness_of :name, :ip, :tap, :mac, :vnc, :allow_blank => true
  validates_numericality_of :tap, :vnc, :allow_blank => true

  attr_accessible :image_name, :ip, :mac, :machine_id, :name, :note, :tap, :vnc

  def self.per_page
    10
  end

  def add_project(project_ids)
    self.projects = []
    project_ids.each do |id|
      self.projects << Project.find(id) rescue nil
    end if project_ids
  end
end
