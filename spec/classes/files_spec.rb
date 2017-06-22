require'spec_helper'

describe 'spamassassin', :type => :class do  
	let(:node) { 'testhost.example.com' }

  describe 'when called with no parameters on redhat' do

    let (:facts) { {
			:osfamily  => 'Redhat',
			:ipaddress => '127.0.0.1'
                 } } 

   it {
      should contain_package('spamassassin').with({
				'ensure' => 'present',
      })

      should contain_file('v312.pre').with({
				'ensure' => 'file',
				'source' => 'puppet:///modules/spamassassin/v312.pre',
      })

      should contain_service('spamassassin').with({
				'ensure' => 'running',
				'enable' => 'true',
      })
    }

  end
end
