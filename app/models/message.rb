class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  validates :body, presence: true, unless: :attachment_data

  after_create_commit :broadcast_message

  include AttachmentUploader[:attachment]

  scope :sent_messages, ->(sender, receiver) { where(sender_id: sender.id, receiver_id: receiver.id) }
  scope :received_messages, -> (receiver) { where(receiver_id: receiver.id) }
  scope :unread_messages, ->() { where(read_status: false) }
  scope :between_range, ->(from, to) { where('messages.id >= ?', from).where('messages.id < ?', to) }
  scope :ordered, -> { order(:id) }

  def attachment_name=(name)
    @attachment_name = name
  end

  def attachment_name
    @attachment_name
  end
    
  def self.users_messages(sender, receiver)
    self.sent_messages(sender, receiver).or(self.sent_messages(receiver, sender)).ordered
  end

  def self.base_index
    self.order(:id).first.id
  end

  def read!
    self.update_attribute(:read_status, true)
  end

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end
