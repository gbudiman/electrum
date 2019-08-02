# frozen_string_literal: true

require 'electrum/quark'

describe Electrum::Quark do
  let(:quark) { described_class.new('admin', 'admin1234') }

  it 'generates token' do
    expect { quark.login }.to change { quark.access_token }.from(nil)
  end
end
