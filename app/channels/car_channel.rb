class CarChannel < ApplicationCable::Channel
  def subscribed
    stream_from "car_#{params[:room]}"
  end
end