pots = [
  "https://upload.wikimedia.org/wikipedia/commons/a/ab/Patates.jpg",
  "http://www.valleyspuds.com/wp-content/uploads/Russet-Potatoes-cut.jpg",
  "http://images.scrippsnetworks.com/up/tp/Scripps_-_Food_Category_Prod/64/647/0227360_630x355.jpg",
  "http://cdn1.medicalnewstoday.com/content/images/articles/280/280579/potatoes.jpg",
  "http://101healthybody.com/images/photo/Potato.jpg",
  "http://www.seriouseats.com/images/2014/11/20141116-salt-roasted-potatoes-recipe-02.jpg",
  "https://cdn.authoritynutrition.com/wp-content/uploads/2015/03/a-bunch-of-white-potatoes.jpg",
  "http://clv.h-cdn.co/assets/15/41/tk-blog-scalloped-hasselback-potatoes-11.jpg",
  "http://ralp.net/potatoes/img/potato.jpg",
  "http://ladysmithgazette.co.za/wp-content/uploads/sites/64/2016/02/bag-of-potatoes-potbag1.jpg",
  "http://s.hswstatic.com/gif/potato-questions-1.jpg"
]

30.times do
  Product.create!(
    price: rand(1...30),
    name: "#{Faker::Demographic.race} potatoe",
    description: Faker::Hipster.sentences.join(' '),
    image: pots.sample
  )
end

User.create(email: "admin@admin", password: "1234567", password_confirmation: "1234567", admin: true)

p "made #{Product.count} products"
