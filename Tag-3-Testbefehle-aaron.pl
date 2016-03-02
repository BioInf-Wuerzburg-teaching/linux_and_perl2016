use warnings;
use strict;
use fpr;
use Term::ANSIColor;

my $datei="fanta.fasta";
my %input = fpr::fasta_parser($datei);
my $key=">ID2";
my $result;

foreach my $tmp (keys %input) #$tmp als zwischenspeicher
{
	$result = "$tmp\n$input{$tmp}->{species}\n$input{$tmp}->{sequence}\n \n";

}

#Geklauter Code, geht nicht bisher...
#    print "Exists\n"    if exists $input{$key};
#    print "Defined\n"   if defined $input{$key};
#    print "True\n"      if $input{$key};

#Testroutine
if($input{$key}->{species} eq "Maus")
{
	print color("green"), "\nTest successful. Congrats!\n\n", color("reset");
	print "Result:\n\n";
	print "$result\n\n";
}
else
{
	print color("red"), "\nTest failed. You may get a coffee and look through your code.\n\n", color("reset");
	print "Result:\n\n";
	print "$result\n\n";	
}