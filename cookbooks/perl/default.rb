include_recipe "../perl-build/definitions.rb"

perl '5.22.1'

link "/opt/perl-latest" do
  to "/opt/perl-5.22.1"
end
