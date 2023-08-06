class MessagesController < ApplicationController
  def create
    @conversation = current_user.conversations.find(params[:message][:conversation_id])
    user_message = params[:message][:content]

    @user_message = @conversation.messages.build(content: user_message, role: 'user')
    @user_message.save

    # Create a new message for the AI-generated response
    openAIClient = OpenAiClient.new
    ai_response_message = openAIClient.continue_conversation(@conversation.history)

    @ai_response = @conversation.messages.build(content: ai_response_message, role: 'assistant' )
    @ai_response.save
  end
end