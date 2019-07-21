class V1::MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all

    render json: @meetups, status: :ok
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.save

    render json: @meetups, status: :created
  end

  def destroy
    @meetup = Meetup.where(id: params[:id]).first
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def meetup_params
    params.require(:meetup).permit(:host, :topic, :summary, :location, :happening_on)
  end
end
