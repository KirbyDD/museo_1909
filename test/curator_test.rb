require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/artist.rb'
require_relative '../lib/photograph.rb'
require_relative '../lib/curator.rb'

class CuratorTest < Minitest::Test 
  def setup
    @curator = Curator.new
  end

  def test_it_exist
    assert_instance_of Curator, @curator
  end

  def test_it_starts_with_no_photographs
    assert_equal [], @curator.photographs
  end

  def test_it_starts_with_no_artists
    assert_equal [], @curator.artists
  end

  def test_add_photograph_method
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })
    @curator.add_photograph(photo_1)        
    assert_equal [photo_1], @curator.photographs
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    @curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], @curator.photographs         
  end



  def test_add_artist_method
    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })        
    @curator.add_artist(artist_1)
    assert_equal [artist_1], @curator.artists
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })        
    @curator.add_artist(artist_2)
    assert_equal [artist_1, artist_2], @curator.artists
  end

  def test_find_artist_by_id_method
    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2) 
    assert_equal artist_1, @curator.find_artist_by_id("1")
    assert_equal artist_2, @curator.find_artist_by_id("2")
  end
  
  def test_find_photograph_by_id_method
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    @curator.add_photograph(photo_1)        
    @curator.add_photograph(photo_2)
    assert_equal photo_1, @curator.find_photograph_by_id("1")
    assert_equal photo_2, @curator.find_photograph_by_id("2")
  end

  def test_find_photographs_by_artist_method
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })      
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2) 


   assert_equal [photo_1], @curator.find_photographs_by_artist(artist_1)
   assert_equal [photo_2], @curator.find_photographs_by_artist(artist_2)
  end

  def test_artists_with_multiple_photographs_method
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "2",      
      year: "1954"      
    })       
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "1",      
      year: "1967"      
    })        
    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)
    @curator.add_photograph(photo_3)

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2) 

    assert_equal [artist_2], @curator.artists_with_multiple_photographs
  end

  def test_photographs_taken_by_artists_from_specific_country
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "2",      
      year: "1954"      
    })       
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    photo_3 = Photograph.new({    
      id: "3",      
      name: "Identical Twins, Roselle, New Jersey",      
      artist_id: "1",      
      year: "1967"      
    })        
    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)
    @curator.add_photograph(photo_3)

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2)

    assert_equal [photo_1, photo_2], @curator.photographs_taken_by_artists_from('United States')
    assert_equal [photo_3], @curator.photographs_taken_by_artists_from("France")
    assert_equal [], @curator.photographs_taken_by_artists_from('Japan')
  end

end