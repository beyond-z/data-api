class Role < ApplicationRecord
  has_many :program_memberships
  has_many :people, through: :program_memberships
  has_many :programs, through: :program_memberships
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
  def to_show
    attributes.slice('name')
  end
end
