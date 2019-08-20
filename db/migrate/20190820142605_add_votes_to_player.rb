class AddVotesToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column( :players , :voterecords_count , :integer , default: 0 )
  end
end
