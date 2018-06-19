class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation])
    stream_for conversation
    # stream_for expects an object- in this case an instance of the conversation class that is found via the conversation params
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
