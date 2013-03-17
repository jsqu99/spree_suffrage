class CreatePollAnswers < ActiveRecord::Migration
  def up
    create_table :spree_poll_answers do |t|
      t.string     :answer
      t.integer    :poll_id
      t.timestamps
    end

  end

  def down
    drop_table :spree_poll_answers 
  end
end
