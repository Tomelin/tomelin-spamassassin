require 'spec_helper'

describe 'spamassassin' do

  context 'RedHat' do
    let(:facts) do
    { 
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS' ,
      :architecture => 'x86_64', 
    } 
    let(:title) { 'spamassassin' }
    let(:node) { 'test.example.com' }
     
    end

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_package('spamassassin').with(ensure: ‘present’) }

    it { is_expected.to contain_file('/etc/mail/spamassassin/local.cf')
      .with( 
        :ensure => 'file',
        :require => 'Package[nginx]', 
       ) 
    }


    it { is_expected.to contain_service('spamassassin')
      .with( 
        :ensure => 'running',
        :enabled => true,
       ) 
    }
  
  end

end
