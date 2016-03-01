use warnings;
use strict;
use read_fasta;

my $datei = "fastatest.fasta";
my %output = read_fasta::read_fasta($datei);
foreach my $bla (keys %output)
{
    print "$bla\n";
    print "$output{$bla}->{species}\n";
    print "$output{$bla}->{seq}\n \n";
}

