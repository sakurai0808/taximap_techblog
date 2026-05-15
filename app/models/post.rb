class Post < ApplicationRecord
  has_one_attached :image

  # 共通ルールとして降順にする
  scope :latest, -> { order(created_at: :desc) }
end
