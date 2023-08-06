class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages


  def last_message
    "i am last_message method"
  end

  def pretty_title
    if self.title.present?
      self.title
    else
      "Conversation nb#{self.id}"
    end
  end

  def history
    messages.map do |m| {role: m.role, content: m.content} ; end
  end
end