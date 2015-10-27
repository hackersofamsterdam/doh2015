# SiteController handles the frontend for the website
class SiteController < ApplicationController
  def index
  end

  def redirect
    product = Product.find_by_token params[:token]

    redirect_to product.link
  end
end
