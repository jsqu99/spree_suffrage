class CreatePollVotes < ActiveRecord::Migration
  def change
    create_table :spree_poll_votes do |t|
      t.integer :poll_answer_id
      t.integer :user_id
      t.string :ip_address

      t.timestamps
    end
  end
end
