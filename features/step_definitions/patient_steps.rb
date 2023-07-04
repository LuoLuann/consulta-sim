Given('eu estou na pagina do paciente') do
  visit 'patients/new'
  expect(page).to have_content('Cadastrar Paciente')
end

Given('eu vejo um paciente com cpf {string}') do |cpf|
  fill_in 'patient[fullname]', with: 'MonkeyDLuffy'
  fill_in 'patient[cpf]', with: cpf
  fill_in 'patient[email]', with: 'luffy@test.com'

  select 2000, from: 'patient[birthdate(1i)]'
  select 'October', from: 'patient[birthdate(2i)]'
  select 11, from: 'patient[birthdate(3i)]'

  fill_in 'patient[address_attributes][cep]', with: '55360000'
  fill_in 'patient[address_attributes][city]', with: 'ilha down'
  fill_in 'patient[address_attributes][neighborhood]', with: 'rural'
  fill_in 'patient[address_attributes][street]', with: 'interior'
  fill_in 'patient[address_attributes][next]', with: 'proximo ao lixao'
  click_button 'Confirmar'
  expect(page).to have_content(cpf)
end

When('eu clico em editar e atualizo o email para {string}') do |email|
  click_link 'Editar'
  fill_in 'patient[email]', with: email
  click_button 'Confirmar'
end

Then('eu volto para tela do paciente com cpf {string} atualizado') do |cpf|
  expect(page).to have_content(cpf)
end

Then('eu recebo uma mensagem avisando que o campo do email precisa ser preenchido corretamente') do
  expect(page).to have_content("Email possui um formato inválido")
end
