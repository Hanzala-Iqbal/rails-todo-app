class RootController < ApplicationController

    def about
        puts "about in server"
        render "about" # no need to write if the name is same as about
    end

    def contact
        puts "contact in server"
        #redirect_to("/about") # redirects to some other route.
        render "contact" # no need to write if the name is same as contact
    end

    def index
        @posts = Post.all
        puts "index in server"
        render "index" # no need to write if the name is same as index
    end

    def user
        render json: params
        #render json: params[:name]
    end

    def api
        @response = {
            :status => 200,
            :message => "hello world through api"
        }
        render json: @response
    end

    def add
        @post = Post.new
        @post.title = params[:title]
        @post.description = params[:description]
        @post.save

        @posts = Post.all
        #redirect_to root_url
        redirect_to root_url
    end

end
