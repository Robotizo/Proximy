class EventComment < ApplicationRecord
	belongs_to :user
	belongs_to :event_post
end
