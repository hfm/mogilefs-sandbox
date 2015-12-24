require 'spec_helper'

describe 'cmogstored' do
  describe file('/usr/local/bin/cmogstored') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe group('mogile') do
    it { should have_gid 501 }
  end

  describe user('mogile') do
    it { should exist }
    it { should have_uid 501 }
    it { should belong_to_group 'mogile' }
  end

  describe file('/var/mogdata') do
    it { should be_directory }
    it { should be_owned_by 'mogile' }
    it { should be_grouped_into 'mogile' }
  end
end
