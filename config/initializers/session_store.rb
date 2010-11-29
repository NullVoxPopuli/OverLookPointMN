# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Overlookpointemn_session',
  :secret      => '4ec50468731cb7f8e30b51e17674405b5e5b05f6a9210da963c21e187ea252a70eb70577f0d3ae0faf30e56d0173ba4efd8281609d12cbc984a5740c68e73156'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
