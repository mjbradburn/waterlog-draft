class Lake < ActiveRecord::Base
	has_many :secchis, dependent: :destroy
	has_many :phosphos, dependent: :destroy
end
