class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table :meetups do |t|
      t.string :host
      t.string :topic
      t.string :summary
      t.string :location
      t.datetime :happening_on
      t.timestamps
    end
  end
end
