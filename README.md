# Rails Online Store

Rails Online Store is a <a href="http://rubyonrails.org/">Ruby on Rails</a> application which demonstrates the core functionality of an e-commerce web shop. Authorized users can browse items, add items to their cart and purchase a product using <a href="https://stripe.com/">stripe</a>. Shop admins can add, edit or remove products, managing file uploads with <a href="https://github.com/thoughtbot/paperclip">paperclip</a>.

### Dependencies
* Ruby >= 2.3.1
* Rails >= 5.1.2
* postgres
* bundler

### Installation
```
$ postgres
$ git clone https://github.com/seanpierce/rails_online_store
$ cd rails_online_store
$ bundle install
$ rails db:setup
$ rails s
```

visit <a href="https://localhost:3000">localhost:3000</a> in your browser

### Stripe Setup
* In the root directory create a file called .env
* Make an account at <a href="https://stripe.com/">stripe</a>
* Save you public and secret keys in the .env like so:

```
PUB_KEY = "public key"
SEC_KEY = "secret key"
```


### Authors
Sean Pierce, Tanner Eustice

### License
MIT &copy; 2017
