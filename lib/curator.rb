class Curator
  attr_reader :photographs, :artists
  
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph photo
    @photographs << photo
  end

  def add_artist artist
    @artists << artist
  end

  def find_photograph_by_id id
    @photographs.find {|photo| photo.id == id}
  end

  def find_artist_by_id id 
    @artists.find {|artist| artist.id == id}
  end

  def find_photographs_by_artist artist
    @photographs.find_all {|photo| photo.artist_id == artist.id}
  end

  def artists_with_multiple_photographs
    result = []
    @artists.each do |artist|
      works = find_photographs_by_artist(artist)
      if works.count > 1
        result << artist
      end
    end
    result
  end

  def photographs_taken_by_artists_from country
    result = []
    @artists.each do |artist|
      if artist.country == country
        works = find_photographs_by_artist(artist)
        result << works
      end
    end
    result.flatten
  end
end