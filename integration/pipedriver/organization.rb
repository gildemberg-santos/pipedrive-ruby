module Integration::Pipedriver
  class Organization < Base
    def call(id = nil)
      puts 'Organization#call'
      puts list
    end

    private

    def list 
      @result ||= request('organizations')
      return [] if @result.code != 200

      JSON.parse(@result.body)["data"] || []
    end
  end
end
