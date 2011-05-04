class CreateTestsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :tests_users, :id => false do |t|
      t.integer :test_id
      t.integer :user_id
    end
  
  end

  def self.down
    drop_table :tests_users
  end
end
