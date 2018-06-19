class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_channel"
    # stream_from expects a string as an argument - in this case the hardcoded conversations channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
