class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @chats = Chat.all
  end

  # def new
  #   @chat = Chat.new
  # end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
    redirect_to "index"
  end

  private
    def chat_params
      params.require(:chat).permit(:handle, :text)
    end
end
