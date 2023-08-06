# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
  def index

  end

  def create
    #@question = Question.new(question_params)

    if true #@question.save
      # Process the question and generate the answer
      @answer = generate_answer('@question')

      # Respond to the Turbo Frame with the new answer using Turbo Streams
      respond_to do |format|
        format.turbo_stream
      end
    else
      # Handle validation errors if needed
    end
  end

  private

  def question_params
    params.require(:question).permit(:question)
  end

  def generate_answer(question)
    # Your logic to generate the answer based on the question
    # Replace this with your actual logic to compute the answer
    "This is the answer to the question: #{question}"
  end
end