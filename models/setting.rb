class Setting < ActiveRecord::Base
  def self.load
  	Setting.first || Setting.new
  end
end

	# Setting
	# t.string :about_me,    default: ''
	# t.string :experience,  default: ''
	# t.string :li_link,     default: '',        limit: 1000
	# t.string :fb_link,     default: '',        limit: 1000
	# t.string :address,     default: '',        limit: 255
	# t.string :skype,       default: '',        limit: 255
	# t.string :cv_name,     default: 'cv_name', limit: 255
	# t.timestamps
