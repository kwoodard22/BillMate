require 'rails_helper'

feature 'processing an invoice' do
  scenario 'Household Supplies' do
    house = FactoryGirl.create :house
    #FactoryGirlven I have 4 roomates
    roommates = ['Kelsey', 'Marilyn', 'Tyler', 'Ann']
    roommates.each do |roommate_name|
      kelsey = FactoryGirl.create :roommate,
        name: roommate_name,
        house: house
    end

    visit new_invoice_path
    # when
    fill_in 'Invoice Date', with: '2014/10/29'
    fill_in 'Date Paid', with: '2014/10/29'
    fill_in 'Invoice Period', with: '2014 Oct'
    select 'Supplies', from: 'Expense Category'
    fill_in 'Amount', with: '20.00'
    fill_in 'Comments', with: 'Paper towels'
    select 'Kelsey', from: 'Roommate'
    submit_form

    # THEN
    # I am on the page where I can add another invoice
    # see that kelsey made a payment of $40
    # Kelsey is owed $15
    # All other roomates owe $5
    click_on 'Calculate Expenses'

    select '2014 Oct', from: "Invoice Period"

    # Expectations
    expectations = "
    | Roommate | Total Paid | Portion | Balance |
    |==========|============|=========|=========|
    | Kelsey   |     $20.00 |  $ 5.00 |  $15.00 |
    | Tyler    |     $ 0.00 |  $ 5.00 |  -$5.00 |
    "

    expectations =
      [ 'Kelsey' => { total_paid: '$ 20.00', portion: '$ 5.00', balance: '$ 15.00'},
        'Tyler' => { total_paid: '$ 0.00', portion: '$ 5.00', balance: '-$ 5.00'}
        ]
      # table_diff page.find('#payments'), expectations

      # actual_table = page.find('#payments')
      # table_diff expectations_as_markdown, actual_table
      # actual_as_hash = actual_table.
    expectations.each do |roommate, payment_info|
      payment_row_html_id = dom_id(roommate)

      tr = page.find("tr##{payment_row_html_id}")
      payment_info.each do |key, value|
        expect(tr.find("th.#{key}")).to eq(value)
      end
    end
  end
end
