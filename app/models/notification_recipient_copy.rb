class NotificationRecipientCopy < ApplicationRecord
  belongs_to :recipient, class_name: "User"

  after_create :deliver

  def deliver
    channels.each do |channel_class|
      channel_class.new(self).deliver
    end
  end

  private

  def channels
    [InAppNotificationCenter]
  end
end
