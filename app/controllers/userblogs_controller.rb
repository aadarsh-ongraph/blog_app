class UserblogsController < ApplicationController
    
    # this is static variable store particular login user id
    @@id = 0
    #@@like = false

    # this method is first page or main page or welcome page
    def welcome 

    end

    # this method is show all blog
    def index 
        @userblogs = Userblog.all
        # this params[:id] is particular user login id
        @user = User.find(params[:id])
        @@id = params[:id]
    end 

    # this method is create new blog particular user
    def new  
        @user = User.find(params[:id])
    end
   
    # this method create blog particular user
    def create 
        
        #Userblog.create(title:params[:title], content:params[:content], likes:params[:likes], dislike:params[:dislike], user_id:params[:user_id])
        Userblog.create(title:params[:title], content:params[:content], likescount:0, dislikes:0, user_id:params[:user_id])
        redirect_to "/userblogs/#{params[:user_id]}"
        # for checking
        #redirect_to '/userblogs'
    end

    # this method view particular blog
    def view 
        @userblog = Userblog.find(params[:id])
        
        # this user find by @@id static variable
        @user = User.find(@@id)
    end

    # this method like handle
    # def like 
    #     @userblog = Userblog.find(params[:id])
    #     if @@like == false
    #        @userblog.increment!(:likescount)
    #        @@like = true
    #     else   
    #         @userblog.decrement!(:likescount)
    #         @@like = false
    #     end 
    #     #redirect_to userblog_path(@userblog)
    #     redirect_to "/userblog/view/#{@userblog.id}"
    # end


    # # this method like handle with Like model means likes table
    def like 

        @user = User.find(@@id)
        @userblog = Userblog.find(params[:id])
        #@checklike = Like.find_by_user_id(@user.id)
        @checklike = Like.where(user_id: @user.id, userblog_id: params[:id])
    
        if @checklike.class == NilClass

            Like.create(user_id:@user.id, userblog_id:@userblog.id, like:1)
            @userblog.increment!(:likescount)

            redirect_to "/userblog/view#{@userblog.id}"
        
        elsif @checklike.userblog_id != @userblog.id 
            
            Like.create(user_id:@user.id, userblog_id:@userblog.id, like: 1)
            @userblog.increment!(:likescount)

            redirect_to "/userblog/view#{@userblog.id}"

        elsif @checklike.like == 1 #true 

            @checklike.update(user_id:@user.id, userblog_id:@userblog.id, like:0)
            @userblog.decrement!(:likescount)

            redirect_to "/userblog/view#{@userblog.id}"
        else  

            @checklike.update(user_id: @user.id, userblog_id:@userblog.id, like:1)
            @userblog.increment!(:likescount)

            redirect_to "/userblog/view#{@userblog.id}"
        end
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

            # this is for check
            #redirect_to '/userblogs'

        else   

            flash[:alert] = "Somthing went wrong!"
            redirect_to '/userblog/login'

        end

    end 
end
