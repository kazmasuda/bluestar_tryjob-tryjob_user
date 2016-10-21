class Project < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  has_many :environments
end
