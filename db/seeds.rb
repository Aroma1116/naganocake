# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create(
    genre: "ケーキ"
)

Genre.create(
    genre: "洋菓子"
)

Genre.create(
    genre: "和菓子"
)

Item.create(
    genre_id: 1,
    name: "チョコレートケーキ",
    introduction: "たっぷりのチョコが乗っています",
    price: 1250,
    purchase_status: true
)

Item.create(
    genre_id: 1,
    name: "ショートケーキ",
    introduction: "イチゴが入ってます",
    price: 1200,
    purchase_status: true
)

Item.create(
    genre_id: 2,
    name: "クリームタルト",
    introduction: "クリームが入ってます",
    price: 1600,
    purchase_status: true
)

Item.create(
    genre_id: 3,
    name: "どら焼き",
    introduction: "こしあんが入ってます",
    price: 500,
    purchase_status: true
)