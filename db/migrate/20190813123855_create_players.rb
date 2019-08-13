class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.text :reason
      t.integer :votes , default: 0

      t.timestamps
    end
  end
end
