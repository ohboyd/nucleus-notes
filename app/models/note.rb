class Note < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  before_validation :set_title_using_content, if: :title_missing?

  validates :title, length: { maximum: 30 }, allow_blank: true
  validate :title_or_content_present
  validate :content_length, unless: :content_missing?

  scope :unfinished, -> { where(complete: false) }

  CELEBRATIONS = %w[Yas Congratulations Congrats Nice Hooray Applause Winning Baller
                    Awesome Stoked Amazing Excellent Exceptional].freeze

  private

    def set_title_using_content
      self.title = content&.to_plain_text[0...30]
    end

    def content_missing?
      content.blank?
    end

    def title_missing?
      title.blank?
    end

    def title_or_content_present
      return true unless title_missing? && content_missing?

      errors.add(:base, 'Must have a title or content to create note')
    end

    def content_length
      return true unless self.content.body.to_plain_text.length >= 1000

      errors.add(:content, 'is too long (maximum is 1000 characters)')
    end
end
