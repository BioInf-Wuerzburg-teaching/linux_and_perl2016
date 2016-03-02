use warnings;
use strict;
use fpr;

my $datei="fanta.fasta";
my %input = fpr::fasta_parser($datei);
my $key=">ID2";
my $result;

#check schleife

foreach my $tmp (keys %input) #$tmp als zwischenspeicher
{
	$result = "$tmp\n$input{$tmp}->{species}\n$input{$tmp}->{sequence}\n \n";

}

#Geklauter Code, geht nicht bisher...
#    print "Exists\n"    if exists $input{$key};
#    print "Defined\n"   if defined $input{$key};
#    print "True\n"      if $input{$key};

#CHeck fehlt noch gänzlich bisher nur Result Print
if($input{$key}->{species} eq "Maus")
{
	print "Test successful. Congrats!";
	print "Result:";
	print "$result";
}
else
{
	print "Test failed. You may get a coffee and look through your code.";
	print "Result:";
	print "$result";	
}