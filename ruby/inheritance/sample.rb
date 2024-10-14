
class Sample

  def self.[](version)
    case version
    when 7.1 then puts '7.1'
    when 7.2 then puts '7.2'
    else puts 'unknown version'
    end

    self
  end

end

class Sample71 < Sample[7.1]; end

class Sample72 < Sample[7.2]; end

class Sample73 < Sample[7.3]; end

