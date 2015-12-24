require 'spec_helper'

describe file('/opt/perl-5.22.1/bin/perl') do
  it { should be_executable }
end
