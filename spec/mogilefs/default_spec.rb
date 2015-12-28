require 'spec_helper'

describe 'MogileFS' do
  describe file('/usr/local/mogilefs') do
    it { should be_directory }
  end

  describe group('mogile') do
    it { should have_gid 501 }
  end

  describe user('mogile') do
    it { should exist }
    it { should have_uid 501 }
    it { should belong_to_group 'mogile' }
  end

  describe file('/etc/mogilefs') do
    it { should be_directory }
  end

  describe file('/etc/mogilefs/mogilefsd.conf') do
    it { should be_file }
  end

  describe package('mariadb-devel') do
    it { should be_installed }
  end
end
