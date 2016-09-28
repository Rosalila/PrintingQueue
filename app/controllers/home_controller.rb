class HomeController < ApplicationController
  def index
    @print_logs = PrintLog.all.reverse
    @pickup_logs = PickupLog.all.reverse
  end
end
