# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_campaigner_session',
  :secret      => 'e6ba7068c53d1428054bd6950ae5e329a1221d68e6bb4f245b4646977454350448793fcf3fdc442e3322406e0b1770d54c2102629abf84658bb94f09691991f1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
