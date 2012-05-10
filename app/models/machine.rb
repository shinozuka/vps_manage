class Machine < ActiveRecord::Base
  has_many :virtual_environments

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessible :memory, :name, :note, :cpu

  def self.per_page
    10
  end
end
