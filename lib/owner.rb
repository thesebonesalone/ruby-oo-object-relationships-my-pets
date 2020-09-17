require "pry"

class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    p "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.length
  end
  def self.reset_all
    self.all.clear
  end
  def cats
    Cat.all.select { |cat| cat.owner == self}
  end
  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end
  def buy_cat(cat)
    Cat.new(cat,self)
    #binding.pry
  end

  def buy_dog(dog)
    Dog.new(dog,self)
    
    #binding.pry
  end


  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.each { |cat| cat.mood = "happy"}
  end
  def sell_pets
    self.dogs.each { |dog| dog.mood = "nervous" 
    dog.owner = nil}
    self.cats.each { |cat| cat.mood = "nervous"
    cat.owner = nil}
  end
  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end






end