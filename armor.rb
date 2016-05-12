require_relative 'item'
class Armor < Item
  attr_accessor :protection_hits
  def initialize(name, protection_hits )
    @name = name
    @protection_hits  = protection_hits
  end
  def to_s
    "#{@name},armor saved #{@protection_hits }"
  end
end