class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.is_confirmed 
                time = Time.now
                user.update_attributes(:latest_signin => time)
                sign_in user
                redirect_back_or user
            else 
                flash.now[:info] = 'Адинистратор сайта еще не одобрил вашу заявку'
                render 'new'
            end
        else
            flash.now[:danger] = 'Email или пароль введены не верно'
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end
