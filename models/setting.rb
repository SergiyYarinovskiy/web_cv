class Setting < ActiveRecord::Base
  def self.load
  	Setting.first || Setting.new
  end
end
