Feature: editar um paciente
    As a paciente
    I want to poder editar minhas informacoes
    So that atualizar dados pessoais e corrigir informacoes incorretas ou desatualizadas

# Cenário sem erro
  Scenario: editar email de paciente
    Given eu estou na pagina do paciente
    And eu vejo um paciente com cpf "11111111112"
    When eu clico em editar e atualizo o email para "novoemail@gmail.com"
    Then eu volto para tela do paciente com cpf "11111111112" atualizado

# Cenário com erro
  Scenario: editar email de paciente
    Given eu estou na pagina do paciente
    And eu vejo um paciente com cpf "11111111112"
    When eu clico em editar e atualizo o email para "@gmail.com"
    Then eu recebo uma mensagem avisando que o campo do email precisa ser preenchido corretamente
