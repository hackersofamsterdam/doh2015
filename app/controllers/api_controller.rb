# ApiController
class ApiController < ActionController::Base
  protect_from_forgery with: :null_session

  def product
    # retrieve a single Product
  end

  def products
    # retrieve a collection of Product
  end
end
