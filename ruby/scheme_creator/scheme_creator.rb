require 'erb'

# GPLColor -> Gimp Palette Color String from gpl-file (e. g. "255   0  12")
# RGB      -> RGB Component from Gimp Palette Color String (e. g. string"255")
# Palette  -> Wrapper for Gimp Palette
#             Allows to extract a palette name and
#             color definitions (e. g. "ff cc 00\torange\nff0000\tred ...")

##
# RGB: 0..255
class RGB
  def initialize component
    @component = component
  end

  def to_hex
    @component.to_i.to_s(16).rjust(2, '0')
  end
end

##
# Gimp Palette Color
class GPLColor
  def initialize color
    @color = color
  end

  def to_hex
    compose_format_string :hex
  end

  def to_rgb
    compose_format_string :rgb
  end

  private
  def convert_color_string_to_rgb_array
    # @color.split.map &:to_i
    @color.split.map { |component| RGB.new component }
  end

  # def rgb_component_to_hex rgb_component
  #   rgb_component
  #     .to_s(16)
  #     .rjust(2, '0')
  # end

  def compose_format_string format
    case format
    when :rgb then prefix = 'rgb:'; separator = '/'
    when :hex then prefix = '#';    separator = ''
    end

    "#{prefix}#{convert_color_string_to_rgb_array.map(&:to_hex).join separator}"
  end

  # def compose_color_string
  #   # #007f7f
  #   "##{convert_color_string_to_array.map { |c| to_hex_string c }.join}"
  # end

  # def compose_rgb_string
  #   # rgb:00/7f/7f
  #   "rgb:#{convert_color_string_to_array.map { |c| to_hex_string c}.join('/')}"
  # end
end

class Palette
  def initialize palette
    @palette         = palette
    @palette_name    = @palette.slice /^Name: (.*)$/, 1
    @palette_content = @palette.slice /.*#\n(.*)\n/m, 1
  end

  def name
    @palette_name
  end

  def to_h format: :hex
    Hash[create_definitions_array format]
  end

  private
  def split_to_raw_color_definitions
    @palette_content.split "\n"
  end

  def create_definitions_array format
    split_to_raw_color_definitions.map { |definition|
      raw_value, name = definition.split "\t"
      case format
      when :rgb then value = GPLColor.new(raw_value).to_rgb
      when :hex then value = GPLColor.new(raw_value).to_hex
      end
      [name, value]
    }
  end
end

class SchemeCreator
  @palette = Palette.new(File.read 'sample3.gpl')
  @name    = @palette.name
  @scheme  = @palette.to_h

  def self.name
    @name
  end

  def self.scheme
    @scheme
  end

  def self.build_schemes files
    files.each do |template|
      File.open("#{template}-result", 'w') do |result|
        result.puts(ERB.new(File.read template).result binding)
      end
    end
  end

  def self.main
    build_schemes ['colorscheme.conf', 'themerc']
  end
end

require 'pry'; binding.pry

# palette = Palette.new File.read 'sample3.gpl'

# palette              = File.read 'sample3.gpl'
# palette_name         = palette.slice /^Name: (.*)$/, 1
# palette_conent_lines = palette.slice(/.*#\n(.*)\n/m, 1).split("\n")

# polybar_data = File.read 'colorscheme.conf'


# colors = -> l { [l.split("\t")[1], GPLColor.new(l.split("\t")[0]).to_hex] }

# colors = -> l { l.split("\t").yield_self { |e| [e[1], GPLColor.new(e[0]).to_hex] } }

# hex_colors = -> l { f, s = l.split("\t"); [s, GPLColor.new(f).to_hex] }

# rgb_colors = -> l { f, s = l.split("\t"); [s, GPLColor.new(f).to_rgb] }

# scheme = Hash[ palette.strip
#                       .split('#')
#                       .fetch(1)
#                       .strip
#                       .split("\n")
#                       .map &colors ]


# color_hex_string =
#   palette.slice(/.*#\n(.*)\n/m, 1)
#          .split("\n")
#          .map &hex_colors

# color_rgb_string =
#   palette.slice(/.*#\n(.*)\n/m, 1)
#          .split("\n")
#          .map &rgb_colors

# hex_scheme = Hash[color_hex_string]
# rgb_scheme = Hash[color_rgb_string]

# scheme = hex_scheme
# scheme = rgb_scheme

# erb = ERB.new File.read 'colorscheme.conf'
