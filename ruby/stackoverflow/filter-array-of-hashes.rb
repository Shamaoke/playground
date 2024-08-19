
###
#
# [Ruby syntax error when try to puts literal hash - Stack Overflow](https://stackoverflow.com/questions/50279906/ruby-syntax-error-when-try-to-puts-literal-hash)
#
# [pattern_matching - Documentation for Ruby 3.2](https://docs.ruby-lang.org/en/master/syntax/pattern_matching_rdoc.html)
#
# [Feature #17950: Unable to pattern-match against a String key - Ruby master - Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/17950)
#
# If the initial format of your data is JSON
#
# You can use the Ruby pattern matching mechanism along with the Array#reject method.
#
# If your hash had symbols as keys you could use the Ruby pattern matching mechanism to filter deep structured data.
#

require 'json'

# data = [ {"id"=>10217, "title"=>{"English"=>"Da A a E"}, "value"=>"Da A a E", "properties"=>{"disabled"=>false}},
#          {"id"=>10218, "title"=>{"English"=>"Profondo"}, "value"=>"Profondo", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10219, "title"=>{"English"=>"La macchina da caffè a capsule"}, "value"=>"La macchina da caffè a capsule", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10234, "title"=>{"English"=>"Extender Wifi"}, "value"=>"Extender Wifi", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10246, "title"=>{"English"=>"Da A a F"}, "value"=>"Da A a F", "properties"=>{"disabled"=>false}},
#          {"id"=>10247, "title"=>{"English"=>"Sistematico"}, "value"=>"Sistematico", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10250, "title"=>{"English"=>"4"}, "value"=>"4", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10252, "title"=>{"English"=>"Ruote"}, "value"=>"Ruote", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10268, "title"=>{"English"=>"Sub 8 GHz"}, "value"=>"Sub 8 GHz", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10273, "title"=>{"English"=>"La copertura sul territorio"}, "value"=>"La copertura sul territorio", "properties"=>{"disabled"=>true, "piping_exclude"=>"false", "show_rules"=>nil, "show_rules_logic_map"=>nil}},
#          {"id"=>10280, "title"=>{"English"=>"Da A a G"}, "value"=>"Da A a G", "properties"=>nil} ]

#
# params = { "properties" => { "disabled" => true } }
#
# query = -> { _1 in ^params } #=> doesn't work in ruby 3.0.4. See for details: [Feature #17950: Unable to pattern-match against a String key - Ruby master - Ruby Issue Tracking System](https://bugs.ruby-lang.org/issues/17950)
#

data = JSON.parse(DATA.read.strip, symbolize_names: true)

# params = { properties: { disabled: true } }

# query = -> { (_1 in { properties: { disabled: false } }) or (_1 in { properties: { disabled: nil } }) }

query = -> { _1 in { properties: value }; value in { disabled: false } or value.nil? }

query = -> { _1 in { properties: value } where value in { disabled: false } or value.nil? }

# query = -> { _1 in ^params }

# p data.reject(&query)

p data.grep(query)

-> { _1 in { properties: value } where value in { disabled: false } or value.nil? } |> data.grep(%)

# p JSON.parse(DATA.read.strip, symbolize_names: true).reject { _1 in { properties: { disabled: true } } }

__END__
[ {"id":10217,"title":{"English":"Da A a E"},"value":"Da A a E","properties":{"disabled":false}},

  {"id":10218,"title":{"English":"Profondo"},"value":"Profondo","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10219,"title":{"English":"La macchina da caffè a capsule"},"value":"La macchina da caffè a capsule","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10234,"title":{"English":"Extender Wifi"},"value":"Extender Wifi","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10246,"title":{"English":"Da A a F"},"value":"Da A a F","properties":{"disabled":false}},

  {"id":10247,"title":{"English":"Sistematico"},"value":"Sistematico","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10250,"title":{"English":"4"},"value":"4","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10252,"title":{"English":"Ruote"},"value":"Ruote","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10268,"title":{"English":"Sub 8 GHz"},"value":"Sub 8 GHz","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10273,"title":{"English":"La copertura sul territorio"},"value":"La copertura sul territorio","properties":{"disabled":true,"piping_exclude":"false","show_rules":null,"show_rules_logic_map":null}},

  {"id":10280,"title":{"English":"Da A a G"},"value":"Da A a G","properties":null} ]

