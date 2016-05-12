require_relative 'menu'
require_relative 'character'
require_relative 'dice'
require_relative 'item'
require_relative 'armor'
require_relative 'weapon'

menu = Menu.new("Load Character 1 ",
                "Load Character 2",
                "Fight",
                "Quit "
)

def fight(character1, character2)
  while character1.current_hit_points>0 && character2.current_hit_points>0

    sam_agility_die = Die.new(character1.agility)
    troy_agility_die = Die.new(character2.agility)
    d4 = Die.new(4)
    d5 = Die.new(5)
    d6 = Die.new(6)
    d8 = Die.new(8)
    d10 = Die.new(10)
    d15 = Die.new(15)


    if troy_agility_die.roll > sam_agility_die.roll
      puts "troy goes first"


      if d10.roll < character1.agility
        puts "Troy fights with the slingshot"
        hit = (character2.strength * (1.0 / d4.roll) + (character2.weapon.damage_hits) / d8.roll)
        armor_save = (character1.armor.protection_hits/d15.roll)
        hit1 = hit - armor_save
        if hit1 < 0
          hit1 = 0
        end
        character1.reduce_hits(hit1)


        puts "troy inflicts #{hit} points of damage "
        puts "sam's armor saves #{armor_save} points"
        puts "sams current health is #{character1.current_hit_points} points out of 90"

      else
        d10.roll > character1.agility
        puts "troy misses"


        puts "sam fights with the sword"
        hit = (character1.strength * (1.0 / d4.roll) + (character1.weapon.damage_hits) / d8.roll)
        armor_save = (character2.armor.protection_hits/d15.roll)
        hit1 = hit - armor_save
        if hit1 < 0
          hit1 = 0
        end
        character2.reduce_hits(hit1)


        puts "sam inflicts #{hit} points of damage "
        puts "troy's armor saves #{armor_save} points"
        puts "troy's current health is #{character2.current_hit_points} points out of 47"
        if d10.roll > character2.agility
          puts "sam misses"
        end


        if character1.current_hit_points == 0
          puts "troy wins"
        end
        if character2.current_hit_points ==0
          puts "sam wins"
        end
      end
    end
    if troy_agility_die.roll < sam_agility_die.roll
      puts "sam goes first"


      if d10.roll < character2.agility
        puts "sam fights with the sword"
        hit = (character1.strength * (1.0 / d4.roll) + (character1.weapon.damage_hits) / d8.roll)
        armor_save = (character2.armor.protection_hits/d15.roll)
        hit1 = hit - armor_save
        if hit1 < 0
          hit1 = 0
        end
        character2.reduce_hits(hit1)


        puts "sam inflicts #{hit} points of damage "
        puts "troy's armor saves #{armor_save} points"
        puts "troy's current health is #{character2.current_hit_points} points out of 47"

      elsif d10.roll > character2.agility
        puts "sam misses"


        puts "troy fights with the slingshot"
        hit = (character2.strength * (1.0 / d4.roll) + (character2.weapon.damage_hits) / d8.roll)
        armor_save = (character1.armor.protection_hits/d15.roll)
        hit1 = hit - armor_save
        if hit1 < 0
          hit1 = 0
        end
        character1.reduce_hits(hit1)


        puts "troy inflicts #{hit} points of damage "
        puts "sam's armor saves #{armor_save} points"
        puts "sam's current health is #{character1.current_hit_points} points out of 90"
        if d10.roll > character1.agility
          puts "troy misses"
        end


        if character1.current_hit_points == 0
          puts "troy wins"
        end
        if character2.current_hit_points ==0
          puts "sam wins"
        end
      end
    end
  end
end


character1_loaded = false
character2_loaded = false

while (choice = menu.get_menu_choice) != menu.quit
  case choice
    when 1
      puts "load character 1, sam.txt"
      file1 = gets.chomp
      character1_file = File.open(file1)
      line1 = character1_file.gets.chomp.split(",")
      line2 = character1_file.gets.chomp.split(",")
      line3 = character1_file.gets.chomp.split(",")
      character1_file.close

      weapon =Weapon.new(line2[0], line2[1].to_i)
      armor =Armor.new(line3[0], line3[1].to_i)
      character1 = Character.new(line1[0], line1[1], line1[2].to_i, line1[3].to_i, line1[4].to_i, weapon, armor)
      character1_loaded = true
      puts character1.inspect

    when 2
      puts "load character 2, troy.txt"
      file2 = gets.chomp
      character2_file = File.open(file2)
      line1 = character2_file.gets.chomp.split(",")
      line2 = character2_file.gets.chomp.split(",")
      line3 = character2_file.gets.chomp.split(",")
      character2_file.close

      weapon =Weapon.new(line2[0], line2[1].to_i)
      armor =Armor.new(line3[0], line3[1].to_i)
      character2 = Character.new(line1[0], line1[1], line1[2].to_i, line1[3].to_i, line1[4].to_i, weapon, armor)
      character2_loaded = true
      puts character2.inspect
    when 3
      puts "fight"
      if character1_loaded && character2_loaded
        fight(character1, character2)

      else
        puts "characters have not been loaded "
      end
    when 4

      puts "quit"
  end
end