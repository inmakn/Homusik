class CreateRatios < ActiveRecord::Migration
  def change
    create_table :ratios do |t|
      t.string :lastfm_username_entry
      t.string :country_entry
      t.string :city_entry
      t.integer :ratio_output
      t.belongs_to :user

      t.timestamps
    end
  end
end
