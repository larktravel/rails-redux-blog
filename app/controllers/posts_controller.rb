class PostsController < ApplicationController
  # include DeviseTokenAuth::Concerns::SetUserByToken

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render 'show'
    else
      render json: { errors: @post }, status: :not_modified
    end
  end

  def create
    @post = Post.create(post_params)
    render :show
  end

  def raw_params
    {
      title: params[:title],
      category: params[:category],
      body: params[:body]
    }
  end


  def post_params
    return raw_params unless params[:post]
    params.require(:post).permit(
      :title,
      :category,
      :body
    )
  end
end
