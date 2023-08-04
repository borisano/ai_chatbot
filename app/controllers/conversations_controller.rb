class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.conversations
    respond_to do |format|
      format.html # Render the regular HTML view
      format.turbo_stream { render turbo_stream: turbo_stream.append("conversation-list", partial: "conversations/conversation_list", locals: { conversations: @conversations }) }
    end
  end

  def create
    @conversation = current_user.conversations.build(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to conversations_path, notice: 'Conversation was successfully created.' }
        format.turbo_stream { render turbo_stream: turbo_stream.append("conversations", partial: "conversations/conversation", locals: { conversation: @conversation }) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def show
    @conversation = current_user.conversations.find(params[:id])
    @message = Message.new
    respond_to do |format|
      #format.html

      format.turbo_stream { render turbo_stream: turbo_stream.replace("messages-frame", partial: "conversations/messages", locals: { conversation: @conversation }) }
    end
  end

  def new
    @conversation = Conversation.new
    respond_to do |format|
      format.html
      format.turbo_stream # Make sure to include this line
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user_id)
  end
end