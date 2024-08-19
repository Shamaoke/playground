#
# See `https://stackoverflow.com/questions/66412832/nomethoderror-undefined-method-for-nilnilclass-for-variable-in-private-met/66413036` for details
#

#
# Run the script with `ruby -I . -r hubspot_api -e 'HubSpotApi::CompanyImporter.main'`
#

module HubSpotApi

  class CompanyImporter
    MAX_RETRIES = 3

    def initialize
      @attempt = 0
    end

    def attempt_succ!
      @attempt = @attempt.succ
    end

    def hubspot_record
      loop do
        if attempt_succ! <= MAX_RETRIES
          puts "#{@attempt} continue"
        else
          puts 'end'
          break
        end
      end
    end

    def self.main
      self.new.hubspot_record
    end
  end

end

