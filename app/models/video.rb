class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["comments", "likes", "user", "video_file_attachment", "video_file_blob"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at", "user_id", "views_count"]
  end
end
