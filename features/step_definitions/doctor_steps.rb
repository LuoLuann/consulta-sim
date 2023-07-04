Given('eu estou na pagina de medico') do
  visit 'doctors/new'
  expect(page).to have_content('Cadastrar Médico')
end

Given('eu vejo um medico com crm {int}') do |crm|
  fill_in 'doctor[fullname]', with: 'Tony Tony Chopper'
  fill_in 'doctor[cpf]', with: '12398745650'
  fill_in 'doctor[email]', with: 'chopper@test.com'
  fill_in 'doctor[specialty]', with: 'Reumatologista'
  fill_in 'doctor[crm]', with: crm
  click_button 'Confirmar'
  expect(page).to have_content(crm)
end

When('eu clico em editar o medico e atualizo especialidade para {string}') do |specialty|
  click_link 'Editar'
  fill_in 'doctor[specialty]', with: specialty
  click_button 'Confirmar'
end

Then('eu volto para tela do medico com crm {int} foi atualizado') do |crm|
  expect(page).to have_content(crm)
end

Then('eu recebo uma mensagem avisando que o campo da especialidade precisa ser preenchido corretamente') do
  expect(page).to have_content("Specialty is invalid")
end

# Given('eu estou na pagina de menu') do
#   visit '/'
# end

# When('eu clico em exibir medicos') do
#   click_link "Listar Médicos"
# end

# Then('eu vejo todos os medicos e suas informações') do
#   expect(page).to have_content('Listar Médicos')
# end
