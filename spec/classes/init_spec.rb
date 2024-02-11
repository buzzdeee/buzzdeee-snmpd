require 'spec_helper'
describe 'snmpd' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('snmpd') }
  end
end
