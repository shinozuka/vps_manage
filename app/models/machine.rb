class Machine < ActiveRecord::Base
  has_many :virtual_environments

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessible :memory, :name, :note, :cpu

  def self.per_page
    10
  end

  def destroy?
    return false if self.virtual_environments.size > 0
    true
  end
end
