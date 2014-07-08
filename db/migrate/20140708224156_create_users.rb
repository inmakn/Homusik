class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :lastfm_username
      t.text :photo_url
      t.string :city
      t.string :password_digest

      t.timestamps
    end
  end
end
