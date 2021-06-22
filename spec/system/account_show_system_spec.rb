# frozen_string_literal: true

require 'spec_helper'

describe 'AccountShow', type: :system, js: true do
  include SystemHelpers

  it 'shows password when clicking show password button' do
    login_as_user(:bob)

    visit("/accounts/#{accounts(:account1).id}")
    expect(page).to_not have_selector('input#cleartext_password', visible: true)

    find('a.show-password-button').click

    expect(page).to have_selector('input#cleartext_password', visible: true)
  end

end