class RenameRatioAttributes < ActiveRecord::Migration
  def change
    rename_column :ratios, :lastfm_username_entry, :lastfm_username
    rename_column :ratios, :city_entry, :city
    rename_column :ratios, :country_entry, :country
  end
end
