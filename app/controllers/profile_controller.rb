class ProfileController < ApplicationController


	def new
		@profile = Profile.new
	end

	def create

		profile = Profile.create(user_params, current_user.id)
		profile.user_id = current_user.id
		profile.save

		# redirect_to home_path


	end

	private


	   def user_params
    	params.require(:profile).permit(:name, :ssn, :ein, :address, :city, :state, :zip, :facebook, :balance)
    end


end