class CreatePolls < ActiveRecord::Migration[8.0]
  def change
    create_table :polls do |t|
      t.string :ip, null: false

      t.timestamps
    end
  end
end
