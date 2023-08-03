class CreateOpenAiDatabasTables < ActiveRecord::Migration[7.0]
  def change

    # Create the Conversations table
    create_table :conversations do |t|
      t.references :user, foreign_key: true
      # add other conversation-specific attributes as needed
      t.timestamps
    end

    # Create the Messages table
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.string :role
      t.text :content
      # add other message-specific attributes as needed
      t.timestamps
    end
  end
end
