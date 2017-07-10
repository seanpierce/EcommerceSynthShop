20.times do
  Product.create!(
    price: rand(1...30),
    name: Faker::Name.title,
    description: Faker::Hipster.sentences.join(' ')
  )
end

p "made #{Product.count} products"
