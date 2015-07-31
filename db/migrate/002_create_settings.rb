class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :about_me, default: ''
      t.string :experience, default: ''
      t.string :li_link, default: '', limit: 1000
      t.string :fb_link, default: '', limit: 1000
      t.string :address, default: '', limit: 255
      t.string :skype, default: '', limit: 255
      t.timestamps
    end
  end

  def self.down
  	drop_table :settings
  end
end
