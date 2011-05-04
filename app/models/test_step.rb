class TestStep < ActiveRecord::Base
  belongs_to :test
  default_scope :order => 'id'
  
end
