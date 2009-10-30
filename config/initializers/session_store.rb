# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_braspag-rails-demo_session',
  :secret      => '418c72f6a96c11ce83c3e7b70772c90b3271c08f8b43691dd8ca6b4d243653dc6c9ca23471928e8cdd2ce4990ce76186cc7d9db02e7a2b757c2c0ce45fe8ff40'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
