class UsersController < ApplicationController

	def edit
		if current_user.admin?
			@user = User.find(params[:id])
		else
			render status: :forbidden
		end
	end

  def update
  	@user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user.business, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :business_id, :business, :admin, :email, :password)
  end

end