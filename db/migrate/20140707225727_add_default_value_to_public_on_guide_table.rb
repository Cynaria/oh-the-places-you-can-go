class AddDefaultValueToPublicOnGuideTable < ActiveRecord::Migration
  def change
  	change_column :guides, :public, :boolean, :default => true
  end
end
