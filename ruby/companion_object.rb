
class Sample
  def do_one = 'ok!'
  def do_two = 'ok too!'
  p self
  p self.class
end

class << Sample
  def express_one = 'ok expressed!'
  def express_two = 'ok expressed two!'
  p self
  p self.class
end

class << S = Sample.new
  def do_three = 'ok free!'
  def do_four = 'ok for!'
  p self
  p self.class
end

