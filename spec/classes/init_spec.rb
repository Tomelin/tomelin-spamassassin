require 'spec_helper'
describe 'spamassassin' do
  context 'with default values for all parameters' do
    it { should contain_class('spamassassin') }
  end
end
