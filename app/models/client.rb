class Client < ApplicationRecord
  validates :first_name, :last_name, :email, :secondary_id, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_validation :set_full_name

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[first_name last_name email full_name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

  def set_full_name
    return unless full_name.blank?

    self.full_name = full_name
  end
end
