class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@users = User.new
	end

	def create
		@users = User.create(user_params)
		@users.save
		respond_to do |format|
			format.html { redirect_to action: "index"}
		end
	end

	def show
		@users = User.find(params[:id])
	end

	def edit
		@users = User.find(params[:id])
	end

	def destroy
		@users = User.find(params[:id])
		@users.destroy
		respond_to do |f|
			f.html { redirect_to action: "index", notice: "User was successfully destroyed."}
		end
	end

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
