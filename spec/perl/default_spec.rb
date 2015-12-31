require 'spec_helper'

describe file('/opt/perl-5.20.3/bin/perl') do
  it { should be_executable }
end
