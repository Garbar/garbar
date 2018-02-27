
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {:except => %w[fandoms authors]}
DatabaseCleaner.strategy = :truncation
# then, whenever you need to clean the DB
DatabaseCleaner.clean

imdb_list = %w(tt2487938 tt2819924 tt1936532 tt1129398 tt2294189 tt2396135
              tt1693592 tt1652216 tt1888075 tt1119644 tt0362357 )


imdb_list.each do |i| 
  movs = OmdbapiService.new(imdb_id: i).call
  mov = Movie.create(title:movs[:title], years:movs[:year], actors:movs[:actors], description:movs[:plot], imdb_id:movs[:imdb_id], status:0)
  Note.create(description: '', movie_id: mov.id, bechdel: 0, characters: '' )
  movs[:country].each do |c| 
    mov.countries << Country.find_by_id(c)
  end
    movs[:genres].each do |g| 
    mov.genres << Genre.find_by_id(g)
  end
end