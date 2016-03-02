use warnings;
use strict;
use read_fasta;
use Test::More tests=>3;

my $datei = "fastatest.fasta";
my %output = read_fasta::read_fasta($datei);
my $wert1 = $output{">ID1"}->{species};
my $wert2 = $output{">ID1"}->{seq};
my $expected1 = "Mensch";
my $expected2 = "CTAFGTILV";

require_ok("read_fasta");
is($wert1, $expected1, my $test_species);
is($wert2, $expected2, my $test_sequence);

# if ($output{">ID1"}->{species} eq "Mensch")
# {
#     print "species funktioniert\n";
#     if ($output{">ID1"}->{seq} eq "CTAFGTILV")
#     {
# 	print "sequence funktioniert\n";
#     }
#     else
#     {
#         print "sequence funktioniert nicht\n";
#     }
# }
# else
# {
#     print "species funktioniert nicht\n";
#     if ($output{">ID1"}->{seq} eq "CTAFGTILV")
#     {
# 	print "sequence funktioniert\n";
#     }
#     else
#     {
#         print "sequence funktioniert nicht\n";
#     }
# }

