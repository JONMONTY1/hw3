class PostsController < ApplicationController

  def show
    @post = Post.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @contact["place_id"]})
  end

  def new
    @post = Post.new
    @post["place_id"] = params["place_id"]
  end

  def create
    @post = Post.new

    @post["title"] = params["post"]["title"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["description"] = params["post"]["description"]

    @post["place_id"] = params["post"]["place_id"]

    @post.save

    redirect_to "/places/#{@post["place_id"]}"
  end

end