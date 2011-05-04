class Service < ActiveRecord::Base
  belongs_to :project
  has_many :tests
end
