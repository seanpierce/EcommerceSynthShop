Rails.configuration.stripe = {
  :publishable_key => ENV['PUB_KEY'],
  :secret_key      => ENV['SEC_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
