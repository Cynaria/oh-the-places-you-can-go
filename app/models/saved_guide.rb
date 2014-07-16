class SavedGuide < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :guide

  # Validations
  validates_uniqueness_of :user_id, scope: :guide_id

end
