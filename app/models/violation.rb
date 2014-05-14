class Violation < ActiveRecord::Base
	has_many :tickets
end