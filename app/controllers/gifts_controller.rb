class GiftsController < ApplicationController
  def vote;
  end

  def results
    @gifts = Gift.order(:upvotes, :desc)
  end
end
