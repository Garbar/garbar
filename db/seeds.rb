
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {:except => %w[fandoms authors]}
DatabaseCleaner.strategy = :truncation
# then, whenever you need to clean the DB
DatabaseCleaner.clean

# imdb_list = %w(tt2487938 tt2819924 tt1936532 tt1129398 tt2294189)