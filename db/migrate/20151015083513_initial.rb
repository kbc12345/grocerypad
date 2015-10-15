class Initial < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :access_token
      t.string :encrypted_password
    end

    create_table :product_categories do |t|
      t.string :name
    end

    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :product_category_id
      t.timestamps
      t.integer :creator_id
      t.integer :updator_id
    end

    create_table :grocery_items do |t|
      t.string :product_name
      t.integer :product_id
      t.string :product_category
      t.decimal :product_price
      t.integer :quantity
      t.integer :creator_id
      t.integer :updator_id
      t.timestamps
    end

    create_table :groceries do |t|
      t.string :status
      t.integer :month
      t.integer :year
      t.integer :half
      t.integer :updator_id
      t.datetime :delivered_date
    end

    create_table :logs do |t|
      t.integer :user_id
      t.timestamps
      t.text :content
      t.integer :parent_id
      t.string :parent_type
    end
  end
end