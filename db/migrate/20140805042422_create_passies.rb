class CreatePassies < ActiveRecord::Migration
  def change
    create_table :passies do |t|

      t.timestamps
    end
  end
end
