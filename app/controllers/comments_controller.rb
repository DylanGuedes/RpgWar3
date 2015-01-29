class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.order('created_at DESC')
  end

  def remove_excessive
    all_comments = Comment.all
    if all_comments.count > 100
      new_order = Comment.order('created_at DESC')
      new_order.each do |comment|
        all_comments = Comment.all
        if all_comments.count > 100
          comment.destroy
        end
      end
    end
  end

  def create
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          remove_excessive
          flash[:success] = 'Your comment was successfully posted!'
        else
          flash[:error] = 'Your comment cannot be saved.'
        end
        format.html { redirect_to root_url }
        format.js
      else
        format.html { redirect_to root_url }
        format.js { render nothing: true }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end