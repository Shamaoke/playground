
require 'benchmark'
require 'psych'
require 'erb'

module Sample
  def tarai x, y, z
    case
    when x <= y then z
    else
      tarai( tarai(x.pred, y, z),
             tarai(y.pred, z, x),
             tarai(z.pred, x, y) )
    end
  end

  module_function :tarai
end

data = Psych.load(File.read(__FILE__).slice(/(?<=^__END__$)(.*)/m, 1), symbolize_names: true)

sequential = Benchmark.realtime {

  4.times { Sample.tarai(20, 10, 0) }

}.to_i

parallel = Benchmark.realtime {

  4.times.map {
    Ractor.new { Sample.tarai(20, 10, 0) }
  }.each(&:take)

}.to_i

benchmarks = { sequential: sequential, parallel: parallel }

puts ERB.new(data[:report][:sequential]).result_with_hash(benchmarks),
     ERB.new(data[:report][:parallel]).result_with_hash(benchmarks)

__END__
report:
  sequential: |-
    The sequential's version of tarai's real time is <%= sequential %> seconds.

  parallel: |-
    The parallel's version of tarai's real time is <%= parallel %> seconds.

