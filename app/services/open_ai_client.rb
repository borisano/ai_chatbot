class OpenAiClient
  MODEL = "gpt-3.5-turbo"
  TEMPERATURE = 0.7

  def initialize(api_key = nil)
    @api_key = api_key || ENV['OPENAI_API_KEY']
    raise "No API key provided or found in ENV['OPENAI_API_KEY']" unless @api_key

    @client = OpenAI::Client.new(access_token: @api_key)
  end

  def continue_conversation(dialogue_history, model: MODEL, temperature: TEMPERATURE)
    validate_dialogue_history(dialogue_history)

    begin
      response = @client.chat(
        parameters: {
          model: model,
          messages: dialogue_history,
          temperature: temperature
        }
      )
      response['choices'][0]['message']['content']
    rescue StandardError => e
      'Sorry, I am having trouble processing the request. Please try again later.'
    end
  end

  private

  def validate_dialogue_history(dialogue_history)
    raise ArgumentError, "dialogue_history must be an array" unless dialogue_history.is_a?(Array)
  end
end