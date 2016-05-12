require_relative 'item'
class Weapon < Item
  attr_accessor :damage_hits
  def initialize(name,damage_hits)
    @name = name
    @damage_hits = damage_hits
  end
  def to_s
    "#{@name},#{@damage_hits}"
  end
end