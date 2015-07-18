class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :business_categories do |t|
      t.belongs_to :category, null: false
      t.belongs_to :business, null: false

      t.timestamps null: false
    end
  end
end
