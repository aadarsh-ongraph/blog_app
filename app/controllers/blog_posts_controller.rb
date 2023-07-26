class BlogPostsController < ApplicationController

    def index
        @blog_posts = BlogPost.all
    end
    
    def new
        @blog_post = BlogPost.new
     end
    
    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
          redirect_to blog_posts_path
        else
          render :new
        end
    end

    def show  
        @blog_post = BlogPost.find(params[:id])
    end 

    def like
        @blog_post = BlogPost.find(params[:id])
        @blog_post.increment!(:likes)
        redirect_to blog_post_path(@blog_post)
    end
    
    def dislike
        @blog_post = BlogPost.find(params[:id])
        @blog_post.increment!(:dislikes)
        redirect_to blog_post_path(@blog_post)
    end

    private

    def blog_post_params
       params.require(:blog_post).permit(:title, :content)
    end

end
