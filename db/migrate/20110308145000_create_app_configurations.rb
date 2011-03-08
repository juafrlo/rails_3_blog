class CreateAppConfigurations < ActiveRecord::Migration
  def self.up
    create_table :app_configurations do |t|
      t.string :environment
      t.string :user
      t.string :password
      t.string :email
      t.string :site_url

      t.timestamps
    end
  end

  def self.down
    drop_table :app_configurations
  end
end
