ActiveRecord::Schema[7.0].define(version: 20_230_807_145_147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'foods', force: :cascade do |t|
    t.string 'name'
    t.string 'measurement_unit'
    t.decimal 'price'
    t.integer 'quantity'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'recipe_foods', force: :cascade do |t|
    t.integer 'quantity'
    t.integer 'recipe_id'
    t.integer 'food_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'prescription_time'
    t.integer 'cooking_time'
    t.text 'description'
    t.boolean 'public'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
