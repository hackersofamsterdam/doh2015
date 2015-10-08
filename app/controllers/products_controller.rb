class ProductsController < AdminController
  before_action :set_channel
  before_action :set_product, except: [:index]

  def index
    @products = @channel.products.page params[:page]
  end

  def show
  end

  def new
    @product = @channel.products.build
  end

  def edit
  end

  def create
    @product = @channel.products.build product_params

    if @product.save
      redirect_to channel_product_path(@channel, @product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to channel_product_path(@channel, @product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to channel_products_path, notice: 'Product was successfully destroyed.'
  end

  private
  def set_channel
    @channel = current_user.channels.find_by_id params[:channel_id]
  end

  def set_product
    @product = @channel.products.find_by_id params[:id]
  end

  def product_params
    params.require(:product).permit(:channel_id, :title, :token, :price, :link)
  end
end
