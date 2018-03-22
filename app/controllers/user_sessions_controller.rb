class UserSessionsController < ApplicationController
 def new
  end

  def create
		@user = User.find_by_email(params[:email])
		if @user.password == params[:password]
			session[:user_id] = @user.id
	 		redirect_to root_path
	 	else 
     		flash[:error] = "Неверный логин или пароль!"
				redirect_to action: :sign_in
		end
	end
end

  def destroy
    session[:user_id] = nil
    redirect_to root_path  
  end
end