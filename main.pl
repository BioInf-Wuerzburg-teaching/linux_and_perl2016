use strict;
use warnings;
use fastatools;
use Data::Dumper;

foreach my $datei (@ARGV)
  {

    my %sequences=fastatools::fasta_parser($datei);


    print Dumper(\%sequences);
  }
