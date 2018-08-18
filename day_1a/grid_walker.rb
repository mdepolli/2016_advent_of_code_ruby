require_relative 'grid_walker/walker'

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
    @data = @data.split(', ').map(&:strip)
  end
end
