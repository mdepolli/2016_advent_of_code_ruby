require_relative 'grid_walker/walker'

class GridWalker
  def initialize(data_origin = './input.txt')
    data_filepath = File.expand_path(data_origin, __dir__)
    @data = if File.exist?(data_filepath)
      File.read(data_filepath)
    else
      data_origin
    end
    @data = @data.split(', ').map(&:strip)
  end

  def run
    Walker.new(@data).run
  end
end
