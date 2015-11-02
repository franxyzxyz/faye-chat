class ChatsController < ApplicationController
  def index
    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
  end

  private
    def chat_params
      params.require(:chat).permit(:handle, :text)
    end
end
