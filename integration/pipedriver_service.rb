module Integration
  class PipedriverService
    def call
      Pipedriver::Owner.new.call
      Pipedriver::Organization.new.call
      # Pipedriver::Person.new({name: "Gildemberg Satos Gomes"}).call
      # Pipedriver::Lead.new({title: "Novo Lead"}).call
    end
  end
end
