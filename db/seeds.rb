synths = []
last_index_img = 0;
last_index_name = 0;
last_index_price = 0;
3.times do |i|
  page = Nokogiri::HTML(open("http://www.dawsons.co.uk/keyboards-pianos/synthesizers?p=#{i + 1}"))
  page.css('.category-products ul li a img').each do |el|
     synths.push({id: last_index_img, img: el["src"]})
     last_index_img += 1
  end
  page.css('.product-info .product-name a').each do |el|
    synths.each do |synth|
      if synth[:id].to_i === last_index_name
        synth[:name] = el.text.to_s
      end
    end
    last_index_name += 1
  end
  page.css('.product-info .price-box .price').each do |el|
    synths.each do |synth|
      if synth[:id].to_i === last_index_price
        synth[:price] = el.text.to_s.gsub(/[£]/, '')
      end
    end
    last_index_price += 1
  end
end

puts synths

products = []
synths.each do |synth|
  product = Product.create!(
    price: synth[:price].to_i,
    name: synth[:name],
    description: Faker::Hipster.sentences.join(' '),
    image: synth[:img],
    purchased_with: ""
  )
  products.push(product)
end

30.times do
  products.each do |product|
    product.purchased_with << "#{products.sample.id},"
    product.save
  end
end

User.create(email: "admin@admin", password: "1234567", password_confirmation: "1234567", admin: true)

p "made #{Product.count} products"
