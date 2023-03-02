module Integration::Pipedriver
  class CreatePerson < Base
    def call
      create
    end

    private

    def create
      raise RequiredPersonName if @params[:name].blank?

      puts 'Person#create'
    end
  end
end
