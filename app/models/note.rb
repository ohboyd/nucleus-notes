class Note < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  validates :title, presence: true, if: :content_missing?
  validates :title, length: { maximum: 30 }, allow_blank: true
  validates :content, presence: true, if: :title_missing?
  validates :content, length: { maximum: 1000 }, allow_blank: true, on: :create

  before_validation :set_title_using_content

  private

    def set_title_using_content
      self.title = content.to_plain_text[0...30] unless content_missing?
    end

    def content_missing?
      content.blank? || content.nil?
    end

    def title_missing?
      title.blank? || title.nil?
    end
end
