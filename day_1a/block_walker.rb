require_relative 'block_walker/walker'

class BlockWalker
  def initialize(data_origin = './input.txt')
    @data = if File.exist?(data_origin)
      File.read(data_origin)
    else
      data_origin
    end
    @data = @data.split(', ').map(&:strip)
  end

  def run
    Walker.new(@data).run
  end
end