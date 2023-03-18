class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

    validate :clickbait_title
    private

  def clickbait_title
    unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.match?(/\bTop \d+\b/) || title.include?("Guess"))
      errors.add(:title, "must be sufficiently clickbait-y!")
    end
  end
end
