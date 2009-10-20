# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stmts_session',
  :secret      => 'be095d79e4e486070db7e9fd790bde1de6d1fc49b3e7941e57c5a652a8606a5439647308eed16fcf5476332efac8fd1bb90ac7d949f6e0de1debeff2d91b4e74'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
