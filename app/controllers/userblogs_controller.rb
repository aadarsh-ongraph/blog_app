class UserblogsController < ApplicationController

    def index 
        @userblogs = Userblog.all
    end 

    def new  

    end

    def create 
        Userblog.create(title:params[:title], content:params[:content], likes:params[:likes], dislikes:params[:dislikes])

        redirect_to '/userblogs'
    end

    def view 
        @userblog = Userblog.find(params[:id])
    end
end
