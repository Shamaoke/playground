
module Scope
  module A
    def do_it = 'Done!'
  end

  module B
    def do_it = 'Nicely done!'
  end
end

load 'a.rb', Scope::A #=> Done!
load 'b.rb', Scope::B #=> Nicely done!

