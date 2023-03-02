module Integration::Pipedriver
  class Owner < Base
    def call
      puts 'Owner#call'
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
