class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|

      t.string :ru, nil: false
      t.string :en, nil: false

      t.timestamps
    end
  end
end


