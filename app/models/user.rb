class User < ApplicationRecord
  has_many :recipient_copies, class_name: "NotificationRecipientCopy"
end
