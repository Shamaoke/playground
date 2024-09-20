require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: 'Договоры'
  end

  test "should create contract" do
    visit contracts_url
    click_on 'Новый договор'

    fill_in 'contract_date', with: @contract.date
    fill_in 'contract_description', with: @contract.description
    fill_in 'contract_number', with: @contract.number
    click_on 'Создать договор'

    assert_text 'Новый договор успешно создан'
    click_on 'К списку договоров'
  end

  test "should update Contract" do
    visit contract_url(@contract)
    # click_on "Edit this contract", match: :first
    click_on 'Редактировать договор', match: :first

    fill_in 'contract_date', with: @contract.date
    fill_in 'contract_description', with: @contract.description
    fill_in 'contract_number', with: @contract.number
    click_on 'Отредактировать договор'

    assert_text 'Договор успешно отредактирован'
    click_on 'К списку договоров'
  end

  test "should destroy Contract" do
    visit contract_url(@contract)
    click_on 'Удалить договор', match: :first

    assert_text 'Договор успешно удален'
  end
end
