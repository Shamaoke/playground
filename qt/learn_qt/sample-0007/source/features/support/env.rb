
require 'xmlrpc/client'

Cucumber::Glue::Dsl.alias_adverb('Step')

XMLRPC::Config.enable_nil_parser = true

After do

  next unless @server_pid

  begin
    Process.kill('TERM', @server_pid)
  rescue Errno::ESRCH
    ## Процесс сервера уже завершен!
  end

  Process.wait(@server_pid)
end

