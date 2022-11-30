class CreateNotificationRecipientCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :notification_recipient_copies do |t|
      t.references :recipient
      t.references :email

      t.timestamps
    end
  end
end
