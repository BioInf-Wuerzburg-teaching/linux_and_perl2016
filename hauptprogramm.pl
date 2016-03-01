use strict;
use warnings;
use fasta_kram;
use Data::Dumper;
my $datei="fanta";
my %sequences=fasta_kram::fasta_parser($datei);

print Dumper(\%sequences);
