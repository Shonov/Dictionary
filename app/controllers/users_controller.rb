 class UsersController < ApplicationController

 	def create
		@user = User.new(user_params)
		if @user.save
		 	flash[:alert] = 'Поздравляем! Вы успешно зарегистрировались.'
			redirect_to root_path
	 	else 
	 			if params[:password] != params[:password_confirmation]
        flash[:error] = "Пароли не совпадают"
    else
	 		redirect_to  action: :sign_up
	 	end
	 end
	end

 def login
 		@user = User.find_by_email(params[:email])
		if @user.password == params[:password]
			session[:user_id] = @user.id
	 		redirect_to root_path
	 		 flash[:success] = "Вы успешно авторизованы"
	 	else 
	 			if params[:password] != @user.password
        flash[:error] = "Неверный пароль!"
	 	else
			redirect_to action: :sign_in
		end
	end
end
	 
	def sign_in
	end

	def sign_up
	 @user = User.new
	end

	def list_words
	end

	private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # def signed_in_user
    #   redirect_to signin_url, notice: "Please sign in." unless signed_in?
    # end
end