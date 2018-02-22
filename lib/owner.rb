require 'pry'

class Owner
  attr_accessor :pets, :name
  attr_reader :species
  @@owners = []


  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @@owners << self
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish)
    fish = Fish.new(fish)
    @pets[:fishes] << fish
  end

  def buy_cat(cat)
    cat = Cat.new(cat)
    @pets[:cats] << cat
  end

  def buy_dog(dog)
    dog = Dog.new(dog)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species, animal|
      animal.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def list_pets
    fish = nil
    dog = nil
    cats = nil
    @pets.each do |species, animal|
      if species[0] == "f"
        fish = "#{animal.count} fish"
      elsif species[0] == "d"
        dog = "#{animal.count} dog(s)"
      elsif species[0] == "c"
        cats = "#{animal.count} cat(s)"
      end
    end
    "I have #{fish}, #{dog}, and #{cats}."
  end

end
