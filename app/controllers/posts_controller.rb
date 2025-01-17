class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def update
        post = Post.find(params[:id])
        post.like_the_post
        post.save
        redirect_to post
    end

    private
    def post_params
        params.require(:post).permit(:blogger_id, :destination_id,  :title, :content, :likes)
    end

end