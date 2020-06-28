class Api::CommentsController < Api::ApiController
  def create
    sign = Sign.new(sign_params)
    if sign.save
      sign.user_submitted! if sign.may_user_submitted?
      render json: sign, serializer: SignDetailSerializer, status: :created
    else
      render json: { errors: sign.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def replies
    replies = CommentReply.where(sign_id: params[:id])
    render json: replies, status: :ok
  end

  def reply
    reply = CommentReply.new(reply_params)
    if reply.save
      render json: reply, status: :created
    else
      render json: { errors: reply.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
  def sign_params
    params.require(:sign).permit(:meaning,
                                 :image,
                                 :sign_type,
                                 :description,
                                 :category_id)
                         .merge(user_id: current_user.id,
                                post_id: params[:post_id])
  end

  def reply_params
    params.require(:comment_reply).permit(:comment).merge(user_id: current_user.id, sign_id: params[:id])
  end
end
