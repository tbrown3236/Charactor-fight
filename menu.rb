class Menu
  attr_reader :quit
  def initialize( *menu_args )
    @menu_items = menu_args
    @quit = @menu_items.count
  end

  def get_menu_choice
    @menu_items.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
    print "Please enter your choice: "
    return gets.to_i
  end
end

