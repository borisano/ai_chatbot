class OpenAiClient

  def initialize
    @api_key =  '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' #ENV['OPENAI_API_KEY']
    @client = OpenAI::Client.new(access_token: @api_key)
  end

  def continue_conversation(dialogue_history)
    @response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: dialogue_history,
        temperature: 0.7
      })

    @response['choices'][0]['message']
  end
end