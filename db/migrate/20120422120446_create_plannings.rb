class CreatePlannings < ActiveRecord::Migration
  def self.up
    create_table :plannings do |t|
      t.integer :campaign_id
      t.date :start_date
      t.date :end_date
      t.integer :num_sent
      t.decimal :expected_response, :precision => 8, :scale => 2
      t.integer :expected_revenue
      t.integer :budgeted_cost
      t.integer :actual_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :plannings
  end
end
