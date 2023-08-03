class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages


  def last_message
    "i am last_message method"
  end
end