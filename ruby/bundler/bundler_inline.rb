
# =begin
require 'bundler/inline'

gemfile(true, quiet: false) do
  source 'https://rubygems.org'

  gem 'haml'
end

template = <<~doc
!!!html
%html
  %head
    %title Sample
  %body
    %div This is a sample.
doc

puts Haml::Template.new { template }.render
# =end

