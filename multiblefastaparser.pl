#FASTA PARSER WITH SUBROUTINE

use warnings;
use strict;
use fpr;


#Hauptprogramm

my $datei="fanta.fasta";
my %input = fpr::fasta_parser($datei);


#PRINTER
foreach my $tmp (keys %input) #$tmp als zwischenspeicher
{
	print "$tmp\n";
	print "$input{$tmp}->{species}\n";
	print "$input{$tmp}->{sequence}\n \n";
}
