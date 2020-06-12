class GameOfLife
  attr_accessor :world, :neighborhood

  def initialize(size)
    @world = Array.new(size){Array.new(size)} 
    @neighborhood  = Array.new(size){Array.new(size)}
  end

  def create_world
    for row in 0..@world.size-1
      for col in 0..@world.size-1
        @world[row][col] = ['_', '1'].sample
        @neighborhood[row][col] = 0
      end
    end
  end

  def print_step
    @world.each { |elem| puts "#{elem}" }
  end

  def print_neighborhood
    @neighborhood.each { |elem| puts "#{elem}" }
  end

  def next_step
    for row in 1..@world.size-2
      for col in 1..@world.size-2
        counter=0
        counter += 1 if @world[row-1][col] == '1'
        counter += 1 if @world[row-1][col-1] == '1'
        counter += 1 if @world[row-1][col+1] == '1'
        counter += 1 if @world[row][col-1] == '1'
        counter += 1 if @world[row][col+1] == '1'
        counter += 1 if @world[row+1][col-1] == '1'
        counter += 1 if @world[row+1][col+1] == '1'
        counter += 1 if @world[row+1][col] == '1'

        @neighborhood[row][col] = counter
      end   
    end
  end 

  def find_life
    for row in 1..@world.size-2      
      for col in 1..@world.size-2
        @world[row][col] = (@neighborhood[row][col] == 2 || @neighborhood[row][col] == 3) ? '1' : '_' 
      end
    end  
  end 
end 

game = GameOfLife.new(10)
game.create_world
game.print_step
game.next_step
puts "_____________________"
puts "Neighborhood Matrix"
game.print_neighborhood
puts "---------------------"
puts "Next generation"
game.find_life
game.print_step