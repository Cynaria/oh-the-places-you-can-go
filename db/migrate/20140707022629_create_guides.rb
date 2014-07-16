class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name
      t.text :description
      t.belongs_to :creator, index: true
      t.boolean :public
      t.string :url_key, index: true

      t.timestamps
    end

  end
end
