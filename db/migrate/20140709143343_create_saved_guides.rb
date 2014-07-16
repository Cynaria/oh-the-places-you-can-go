class CreateSavedGuides < ActiveRecord::Migration
  def change
    create_table :saved_guides do |t|
      t.belongs_to :user, index: true
      t.belongs_to :guide, index: true

      t.timestamps
    end
  end
end
