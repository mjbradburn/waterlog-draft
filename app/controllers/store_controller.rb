class StoreController < ApplicationController


	def index
		@lakes = Lake.order(:lkname)
	end
end
