module Integration::Pipedriver
  class RequiredLeadTitle < StandardError 
    def message
      "Por favor, forneça o 'título' do lead para prosseguir. Este campo é obrigatório."
    end
  end

  class RequiredPersonName < StandardError
    def message
      "Por favor, forneça o 'nome' do contato para prosseguir. Este campo é obrigatório."
    end
  end
end
