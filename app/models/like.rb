class Like < ApplicationRecord
  belongs_to :user
  belongs_to :userblog

  # this method find user_id and userblog_id in same row in Like model
  def self.find_by_user_id_and_userblog_id(user_id, userblog_id)
    where(user_id: user_id, userblog_id: userblog_id)
  end
end
