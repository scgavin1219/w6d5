# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    # Destroy tables (not necessary if using `rails db:seed:replant`)
    puts 'Destroying tables...'
    Cat.destroy_all

    # Reset primary keys (i.e., ids)
    puts 'Resetting id sequences...'
    %w(cats).each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    # Create seed data
    puts 'Creating seed data...'
    c1 = Cat.create!(birth_date: "2015/01/20", color: "tortoise", name: "burger", sex: "F")
    c2 = Cat.create!(birth_date: "2011/02/23", color: :red, name: :clifford, sex: :F)

    puts 'Done!'
  end
