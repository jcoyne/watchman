class CreateTestSteps < ActiveRecord::Migration
  def self.up
    create_table :test_steps do |t|
      t.string :action
      t.string :xpath
      t.string :value
      t.references :test

      t.timestamps
    end
  end

  def self.down
    drop_table :test_steps
  end
end
