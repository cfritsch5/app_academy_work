class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to post_url(@tag.post)
    else
      flash[:errors] = @tag.errors.full_messages
      redirect_to post_url(@tag.post)
    end
  end

  def delete
    @tag = Tag.find
  end


  def tag_params
    params.require(:tag).permit(:name, :post_id)
  end

end
