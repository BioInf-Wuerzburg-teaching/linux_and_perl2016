use warnings;
use strict;
use fpr;
use Term::ANSIColor;
use Data::Dumper;

my $datei="fanta.fasta";
my %input = fpr::fasta_parser($datei);
my $key=">ID3";
my $result;

foreach my $tmp (keys %input) 
{
	$result = "$tmp\n$input{$tmp}->{species}\n$input{$tmp}->{sequence}\n \n";

}

#Testroutine
if($input{$key}->{species} eq "Maus")
{
	print color("green"), "\nTest successful. Congrats!\n\n", color("reset");
	print Dumper(\%input);
}
else
{
	print color("red"), "\nTest failed. You may get a coffee and look through your code.\n\n", color("reset");
	print Dumper(\%input);	
}