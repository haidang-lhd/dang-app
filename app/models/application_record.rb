class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def ransackable_associations(auth_object = nil)
    Rails.logger.info("WITHIN RANSACK ASSOCIATION")
    super + %w[impressionable]
  end
end
