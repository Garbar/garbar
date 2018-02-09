
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {:except => %w[fandoms authors]}
DatabaseCleaner.strategy = :truncation
# then, whenever you need to clean the DB
DatabaseCleaner.clean

imdb_list = %w(tt2487938 tt2819924 tt1936532 tt1129398 tt2294189)

imdb_list.each do |i| 
  movs = OmdbapiService.new(imdb_id: i).call
  mov = Movie.create(title:movs[:title], years:movs[:year], actors:movs[:actors], description:movs[:plot], imdb_id:movs[:imdb_id])
  movs[:country].each do |c| 
    mov.countries << Country.find_by_id(c)
  end
    movs[:genres].each do |g| 
    mov.genres << Genre.find_by_id(g)
  end
end