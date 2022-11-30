class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :title
      t.text :text
      t.string :on_click_url
      t.datetime :sent_at
      t.references :project

      t.timestamps
    end
  end
end
