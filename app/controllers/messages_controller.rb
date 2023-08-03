class MessagesController < ApplicationController
  def create
    @conversation = current_user.conversations.find(params[:conversation_id])
    user_message = params[:message][:content]

    # Call OpenAI's API to get AI-generated response
    response = openai_chat(user_message, @conversation.messages.pluck(:content))

    @message = @conversation.messages.build(content: user_message)
    @message.save

    # Create a new message for the AI-generated response
    ai_response = @conversation.messages.build(content: response['choices'][0]['message']['content'])
    ai_response.save

    broadcast_new_message(ai_response)
  end

  private

  def broadcast_new_message(message)
    turbo_stream.append(
      :messages,
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end