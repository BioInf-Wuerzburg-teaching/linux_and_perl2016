use Test::More tests =>1;
use strict;
use warnings;
use fasta_kram;
use Data::Dumper;
my $datei="fanta";
my %sequences=fasta_kram::fasta_parser($datei);
my $wert1;
my %fasta;
my $wert2;
my $wert3;
my $expected;
my $got;
my $test_name;

#print Dumper(\%sequences);

$wert1=$sequences{'>ID1'};
$wert2=$wert1->{"species"};
ok($wert2 eq "Mensch", "Spezies Test")
