class CreateNinjas < ActiveRecord::Migration[5.1]
  def change
    create_table :ninjas do |t|
      t.string :name
      t.string :guardian_name
      t.string :guardian_contact
      t.text :additional_information
      t.timestamps
    end
  end
end
