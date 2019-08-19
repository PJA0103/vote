class CreateVoterecords < ActiveRecord::Migration[5.2]
  def change
    create_table :voterecords do |t|
      t.references :player, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
