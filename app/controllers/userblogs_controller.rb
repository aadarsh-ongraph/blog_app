class UserblogsController < ApplicationController
   
    # this method is first page or main page or welcome page
    def welcome 

    end

    # this method is show all blog
    def index 
        @userblogs = Userblog.all
        @user = User.find(params[:id])
    end 

    # this method is create new blog particular user
    def new  
        @user = User.all

    end
   
    # this method create blog particular user
    def create 
        Userblog.create(title:params[:title], content:params[:content], likes:params[:likes], dislikes:params[:dislikes], user_id:params[:user_id])

        redirect_to "userblogs/#{params[:user_id]}"
    end

    # this method view particular blog
    def view 
        @userblog = Userblog.find(params[:id])
    end

    # this method like handle
    def like 
        @userblog = Userblog.find(params[:id])
        @userblog.increment!(:likes)
        #redirect_to userblog_path(@userblog)
        redirect_to "/userblog/view/#{@userblog.id}"
    end

    # this method dislike handle
    def dislike
        @userblog = Userblog.find(params[:id])
        @userblog.increment!(:dislikes)
        #redirect_to userblog_path(@userblog)
        redirect_to "/userblog/view/#{@userblog.id}"
    end

    # this is sign_up method
    def sign_up
        @user = User.new
    end 

    # this method create new user for blog app and User model use
    def createUser
        User.create(email:params[:email], password:params[:password])

        redirect_to "/userblog/login"
    end

    # this is login method 
    def login 

    end
    
    # this method check user are existing or not
    def checkuser
        @user = User.find_by_email(params[:email])

        if @user.class == NilClass

            flash[:alert] = "Somthing went wrong!"
            redirect_to '/userblog/login'

        elsif @user.password == params[:password]

            flash[:notice] = "Successfully login!"
            redirect_to "/userblogs/#{@user.id}"

        else   

            flash[:alert] = "Somthing went wrong!"
            redirect_to '/userblog/login'

        end

    end 
end
