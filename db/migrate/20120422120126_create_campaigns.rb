class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name, :uniqueness => true
      t.text :description
      t.string :type
      t.string :status
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
