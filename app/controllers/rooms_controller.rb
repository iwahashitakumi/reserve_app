class RoomsController < ApplicationController
  def index
    @rooms = Room.all
 end
 def new
  @room = Room.new
 end
 def create
   @room = Room.new(params.require(:user).permit(:home_name, :address, :home_type, :money, :home_image))
   if @room.save
     redirect_to :rooms, notice: "保存しました。"
   else
     flash[:alert] = "問題が発生しました。"
     redirect_to :rooms
   end
 end
 def show
 end

 def edit
 end

 def update
 end

 def destroy
 end

end
