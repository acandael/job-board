class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  generates_token_for :unsubscribe

  def self.send_weekly_summary
    find_each do |subscriber|
      SubscriberMailer.with(subscriber: subscriber).weekly_summary.deliver_later
    end
  end
end
