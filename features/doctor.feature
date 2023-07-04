Feature: editar um medico
    As a medico
    I want to poder editar minhas informaçoes
    So that atualizar dados pessoais e corrigir informaçoes incorretas ou desatualizadas

# Cenário sem erro
  Scenario: editar especialidade de medico para especialidade valida
    Given eu estou na pagina de medico
    And eu vejo um medico com crm 123789
    When eu clico em editar o medico e atualizo especialidade para "pediatra"
    Then eu volto para tela do medico com crm 123789 foi atualizado

# Cenário com erro
  Scenario: editar especialidade de medico para especialidade invalida
    Given eu estou na pagina de medico
    And eu vejo um medico com crm 123789
    When eu clico em editar o medico e atualizo especialidade para "1312313"
    Then eu recebo uma mensagem avisando que o campo da especialidade precisa ser preenchido corretamente

# outra historia que usei para fazer testes e entender melhor como funciona
#  Scenario: visualizar medicos
#    Given eu estou na pagina de menu
#    When eu clico em exibir medicos
#    Then eu vejo todos os medicos e suas informações
