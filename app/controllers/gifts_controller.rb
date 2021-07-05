class GiftsController < ApplicationController
  def vote
    ids = Gift.pluck(:id)
    @left = Gift.find(ids.sample)
    ids.delete(@left.id)
    @right = Gift.find(ids.sample)
  end

  def results
    @gifts = Gift.order('upvotes DESC')
  end

  def upvote
    gift = Gift.find(params[:id])
    gift.upvotes += 1
    gift.save

    redirect_to root_path
  end
end
