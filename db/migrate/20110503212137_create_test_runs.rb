class CreateTestRuns < ActiveRecord::Migration
  def self.up
    create_table :test_runs do |t|
      t.datetime :created_at
      t.boolean :status
      t.references :test

      t.timestamps
    end
  end

  def self.down
    drop_table :test_runs
  end
end
