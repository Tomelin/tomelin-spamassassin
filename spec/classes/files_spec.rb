require 'spec_helper'

describe 'spamassassin::files' do
 context 'with default parameters' do

    it { should contain_class('spamassassin') }
    it { should contain_class('spamassassin::files') }
    it { should contain_class('spamassassin::install') }
    it { should contain_class('spamassassin::params') }

    it { should contain_file '/etc/mail/spamassassin/' }
    it { should contain_file '/etc/mail/spamassassin/local.cf' }
    it { should contain_file '/etc/mail/spamassassin/v310.pre' }
    it { should contain_file '/etc/mail/spamassassin/v312.pre' }
    it { should contain_file '/etc/mail/spamassassin/v320.pre' }
    it { should contain_file '/etc/mail/spamassassin/v330.pre' }
    it { should contain_file '/etc/mail/spamassassin/init.pre' }
 end
end
