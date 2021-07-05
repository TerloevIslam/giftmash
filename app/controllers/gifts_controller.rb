class GiftsController < ApplicationController
  def vote
    ids = Gift.pluck(:id)
    @left = Gift.find(ids.sample)
    ids.delete(@left.id)
    @right = Gift.find(ids.sample)

    session[:listed_gifts] = [@left.id, @right.id]
  end

  def results
    @gifts = Gift.order('upvotes DESC')
  end

  def upvote
    gift = Gift.find(params[:id])
    gift.upvotes += 1
    session[:listed_gifts].delete(gift.id)
    gift.save

    downvote

    redirect_to root_path
  end

  private

  def downvote
    remaining_gift = session[:listed_gifts].first
    gift = Gift.find(remaining_gift)
    gift.downvotes += 1
    gift.save

    session[:listed_gifts] = []
  end
end
