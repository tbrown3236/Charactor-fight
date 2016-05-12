require_relative 'item'
require_relative 'weapon'
require_relative 'armor'

class Character
  attr_accessor :name, :race,:current_hit_points, :hit_points, :strength, :agility, :weapon, :armor

  def initialize(name,race,hit_points,strength,agility,weapon,armor)
    @name =  name
    @race = race
    @hit_points = hit_points
    @current_hit_points = hit_points
    @strength = strength
    @agility = agility
    @weapon = weapon
    @armor = armor

  end

  def to_s
    "(#{name},#{race},#{hit_points},#{strength},#{agility},#{weapon},#{armor})"
  end

  def current_status
return "sam's current health is #{@current_hit_points}"
  end

  def revive_character
    @current_hit_points = @hit_points
  end

  def reduce_hits(hit_points)
    @current_hit_points -= hit_points
    if @current_hit_points < 0
      @current_hit_points = 0
    end

  end


end