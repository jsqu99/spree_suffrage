class CreatePolls < ActiveRecord::Migration
  def up
    create_table :spree_polls do |t|
      t.string     :name
      t.string     :question
      t.boolean    :allow_view_results_without_voting, default: false
      t.timestamps
    end

  end

  def down
    drop_table :spree_polls
  end
end
