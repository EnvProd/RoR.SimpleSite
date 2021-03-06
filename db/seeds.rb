# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
    {first_name: 'Artyom', second_name: 'Chernyaev', email: 'artyom@simplesite.ru', password: "123456", password_confirmation: "123456", admin: "true", is_confirmed: "true"},
    {first_name: 'Oleg', second_name: 'Gararanin', email: 'oleg@simplesite.ru', password: "123456", password_confirmation: "123456", admin: "true", is_confirmed: "true"},
    {first_name: 'Ruslan', second_name: 'Ismagilov', email: 'ruslan@simplesite.ru', password: "123456", password_confirmation: "123456", admin: "true", is_confirmed: "true"},
    {first_name: 'Egor', second_name: 'Sidorov', email: 'egor@simplesite.ru', password: "123456", password_confirmation: "123456"},
    {first_name: 'Valera', second_name: 'Petrov', email: 'valera@simplesite.ru', password: "123456", password_confirmation: "123456"},
    {first_name: 'Кирилл', second_name: 'Горкий', email: 'kirill@simplesite.ru', password: "123456", password_confirmation: "123456"},
])