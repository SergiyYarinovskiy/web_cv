class AddCvNameToSettings < ActiveRecord::Migration
  def self.up
    add_column :settings, :cv_name, :string, default: 'cv_name', limit: 255
  end

  def self.down
    remove_column :settings, :cv_name
  end
end
