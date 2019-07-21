class AddUserIdToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :user_id, :integer
  end
end
