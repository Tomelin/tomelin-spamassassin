require 'spec_helper'

describe 'spamassassin', :type => :class do

	describe 'when called with no parameters on redhat' do

		let (:facts) { {
			:osfamily => 'Redhat',
			:ipaddress => '127.0.0.1'
		} }

		it {
			should contain_package('postfix').with({
				'ensure' => 'present',
				'name' => 'postfix',
			})
		}
	end
end
