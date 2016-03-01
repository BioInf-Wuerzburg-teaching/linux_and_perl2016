use warnings;
use strict;
use Data::Dumper;
use fasta_modul;

my $datei1=$ARGV[0];

my %Hash=fasta_modul::fasta_parser($datei1);

print Dumper(\%Hash);
