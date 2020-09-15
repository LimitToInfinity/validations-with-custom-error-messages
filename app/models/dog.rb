class Dog < ApplicationRecord

  # validates(:name, { presence: true })
  validates :name, presence: { message: "Give me a name!" }, uniqueness: { case_sensitive: false, message: "Don't be a copycat" }

  validate :name, :cannot_be_vulgar

  def cannot_be_vulgar
    if name.downcase == 'shit'
      errors.add(:name, 'clean that shit up')
    end
  end
end
