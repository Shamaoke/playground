
require 'psych'
require 'erb'

@data = Psych.load(File.read(__FILE__).slice(/(?<=^__END__$)(.*)/m, 1), symbolize_names: true)

@erb_data = ERB.new @data[:template]

##
# @erb_data.run
#
#=> <html>
#     <head>
#     ...
#

__END__
title: 'Sample'

content: |-
  <p>
    This is a sample html document
  </p>

template: |-
  <!doctype html>
  <html>
    <meta charset='utf-8' />
    <head>
      <title><%= @data[:title] %></title>
    </head>
    <body>
      <main>
        <div>
          <%= @data[:content] %>
        </div>
      </main>
    </body>
  </html>

