class Api::PostsController < Api::ApiController
  def index
    posts = Post.all
    render json: posts, status: 200
  end

  def show
    post = Post.find(params[:id])
    render json: post, serializer: PostDetailSerializer, status: 200
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def upvote
    post = Post.find(params[:id])
    vote = post.votes.find_by(user_id: current_user.id)
    if vote
      success = false
      if vote.up
        #if upvoted, delete vote
        success = vote.destroy
      else
        #if downvoted, change to upvote
        success = vote.update(up: true)
      end
      if success
        render json: post, status: 200
      else
        render json: { errors: vote.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    else
      vote = Vote.new(up: true, voteable_id: post.id, voteable_type: post.class.name, user_id: current_user.id)
      if vote.save
        render json: post, status: 200
      else
        render json: { errors: vote.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end
  end

  def downvote
    post = Post.find(params[:id])
    vote = post.votes.find_by(user_id: current_user.id)
    if vote
      success = false
      unless vote.up
        #if upvoted, delete vote
        success = vote.destroy
      else
        #if downvoted, change to upvote
        success = vote.update(up: false)
      end
      if success
        render json: post, status: 200
      else
        render json: { errors: vote.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    else
      vote = Vote.new(up: false, voteable_id: post.id, voteable_type: post.class.name, user_id: current_user.id)
      if vote.save
        render json: post, status: 200
      else
        render json: { errors: vote.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :content
      # :type
    ).merge(status: "unapproved", user_id: current_user.id)
  end
end
