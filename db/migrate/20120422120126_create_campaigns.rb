class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :status
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
