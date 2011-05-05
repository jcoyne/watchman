class Service < ActiveRecord::Base
  belongs_to :project
  has_many :tests

  def status 
    tests.all?{ |t| t.status }
  end
end
