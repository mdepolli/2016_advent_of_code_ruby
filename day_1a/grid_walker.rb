require_relative 'grid_walker/walker'

# This class serves as an API for the rest of the application. Other than
# calling the main runner class (Walker), it only performs data parsing
# to get the input ready to be processed.
class GridWalker
  def initialize(file_or_string = './input.txt')
    import_data(file_or_string)
    treat_data
  end

  def run
    Walker.new(@data).run
  end

  private

  def import_data(file_or_string)
    filepath = File.expand_path(file_or_string, __dir__)
    @data = \
      if File.exist?(filepath)
        File.read(filepath)
      else
        file_or_string
      end
  end

  def treat_data
    @data = @data.split(', ').map(&:strip).map { |move| parse_move(move) }
  end

  def parse_move(move)
    move.match(/([LR])(\d*)/).captures
  end
end
