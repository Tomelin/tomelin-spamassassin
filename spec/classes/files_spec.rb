require 'spec_helper'

describe 'spamassassin::files', :type => :class do
  let(:node) { 'test.example.com' }

  describe 'when called with no parameters on redhat'do
    let(:facts) do { {
    { 
      :osfamily => 'Redhat',
      :ipaddress => '127.0.0.1' ,
    } }

    it { should contain_package('apache').with({
      'ensure' => 'present',
      'name'   => 'spamassassin',
      })

      should contain_file('v310.pre').with({
        'ensure' => 'file',
        'source' => 'puppet:///modules/spamassassin/v310.pre',
      })

      should contain_service('spamassassin').with({
        'ensure' => 'running',
        'enable' => 'true',
        'name'   => 'spamassassin',
      })

   }
  
  end
end
