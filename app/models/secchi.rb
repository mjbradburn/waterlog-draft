class Secchi < ActiveRecord::Base
	belongs_to :lake
	has_one :chloro, dependent: :destroy
end
