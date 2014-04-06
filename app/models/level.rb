class Level < ActiveRecord::Base
	has_many :assets
	has_many :users
end
