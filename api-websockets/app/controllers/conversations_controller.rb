class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all
    render json: conversations
    # allows JS to pull in the serialized data and display as a single-page-application without need for refresh
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title)
  end


end
