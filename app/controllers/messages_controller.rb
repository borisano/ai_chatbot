class MessagesController < ApplicationController
  def create
    @conversation = current_user.conversations.find(params[:message][:conversation_id])
    user_message = params[:message][:content]

    # Call OpenAI's API to get AI-generated response
    response = openai_chat(user_message, @conversation.history)

    @user_message = @conversation.messages.build(content: user_message, role: 'user')
    @user_message.save

    # Create a new message for the AI-generated response
    @ai_response = @conversation.messages.build(content: 'i am AI message', role: 'assist' )
    @ai_response.save

    #broadcast_new_message(@message)
    # send both messages to the client
    #broadcast_new_message(ai_response)
  end

  private

  def broadcast_new_message(message)
    turbo_stream.append(
      'messages-frame',
      partial: 'messages/message',
      locals: { message: message }
    )
  end


  def openai_chat(user_message, history)
    "blah"
  end

end