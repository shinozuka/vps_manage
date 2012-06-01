class VirtualEnvironment < ActiveRecord::Base
  belongs_to :machine
  has_many :virtual_environment_has_projects
  has_many :projects, :through => :virtual_environment_has_projects 

  validates_presence_of :name
  validates_numericality_of :tap, :vnc, :allow_blank => true
  validates_uniqueness_of :name, :ip, :mac, :allow_blank => true
  validate :check_vnc
  #validates_date :expired_at#, :allow_blank => true

  attr_accessible :image_name, :ip, :mac, :machine_id, :name, :note, :tap, :vnc, :contact, :expired_at

  def self.per_page
    10
  end

  def add_project(project_ids)
    self.projects = []
    project_ids.each do |id|
      self.projects << Project.find(id) rescue nil
    end if project_ids
  end

  def check_vnc
   return unless vnc

   before_vnc = VirtualEnvironment.find(self.id).vnc rescue nil
   return if before_vnc and before_vnc == vnc

   errors.add(:vnc, I18n.t('errors.messages.taken')) if VirtualEnvironment.where(:machine_id => machine_id, :vnc => vnc).first
  end
end
