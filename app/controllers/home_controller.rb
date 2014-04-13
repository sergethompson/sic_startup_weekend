class HomeController < ApplicationController

	before_filter :authenticate_user!

	def index
		@profile = Profile.new
	end



	def create

		profile = Profile.create(user_params)
		profile.user_id = current_user.id
		profile.name = Faker::Name.first_name + " " + Faker::Name.last_name
		profile.address = Faker::Address.street_address
		profile.zip = Faker::Address.zip
		profile.position = Faker::Name.title
		profile.city = Faker::Address.city
		profile.state = Faker::Address.state
		profile.score = rand(1..10)

		profile.email = current_user.email
		profile.save

			redirect_to edit_home_path(profile)
			# redirect_to home_path
	end

	def show

		@profile = Profile.find_by_user_id(current_user.id)

	end

	def edit
		@profile = Profile.find_by_user_id(current_user.id)
	end

		def update
			#binding.pry
			profile = Profile.find(params[:id])
      profile.update_attributes(user_params)

			# profile = Profile.update_attributes(user_params)
			 # redirect_to show_home_path(profile)
			 redirect_to home_path(profile.id)
		end

	private
			def params_id
				params
				
			end

	   def user_params
    	params.require(:profile).permit(:employee_number, :ssn, :ein, :address,
    	 :city, :state, :zip, :facebook, :name, :position, :user_id, :email)
    end


end