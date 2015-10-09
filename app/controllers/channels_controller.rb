class ChannelsController < AdminController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  def index
    @channels = current_user.channels.page params[:page]
  end

  def show
  end

  def new
    @channel = current_user.channels.build
  end

  def edit
  end

  def create
    @channel = current_user.channels.build channel_params

    if @channel.save
      redirect_to @channel, notice: 'Channel was successfully created.'
    else
      render :new
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to @channel, notice: 'Channel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @channel.destroy

    redirect_to channels_url, notice: 'Channel was successfully destroyed.'
  end

  private
  def set_channel
    @channel = current_user.channels.find_by_id params[:id]
  end

  def channel_params
    params.require(:channel).permit(:name, :url)
  end

end
