require 'tmpdir'

tmpdir = Dir.mktmpdir 'chm2pdf-'
hhc    = Dir.chdir tmpdir do |dir| FileUtils.touch '8888.hhc'; File.join dir, Dir.glob('*.hhc').first end

p hhc
