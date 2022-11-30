class InAppNotificationCenter < ApplicationCable::Channel
  def initialize(notification_recipient_copy)
    @notification_recipient_copy = notification_recipient_copy
  end

  def deliver
    event_name = "new_notification"
    event_data = {
      event: {
        name: event_name,
        data: {
          notification: {
            id: @notification_recipient_copy.id
          }
        }
      }
    }
    ably_channel.publish(event_name, event_data)
  end

  private

  def ably_channel
    ably.channel("users/#{recipient.id}")
  end

  def ably
    @ably ||= Ably::Rest.new(key: ENV['ABLY_PRIVATE_KEY'])
  end

  def recipient
    @notification_recipient_copy.recipient
  end
end
