use warnings;
use strict;
use read_fasta;

my $datei = "fastatest.fasta";
my %output = read_fasta::read_fasta($datei);

if ($output{">ID1"}->{species} eq "Mensch")
{
    print "species funktioniert\n";
    if ($output{">ID1"}->{seq} eq "CTAFGTILV")
    {
	print "sequence funktioniert\n";
    }
    else
    {
        print "sequence funktioniert nicht\n";
    }
}
else
{
    print "species funktioniert nicht\n";
    if ($output{">ID1"}->{seq} eq "CTAFGTILV")
    {
	print "sequence funktioniert\n";
    }
    else
    {
        print "sequence funktioniert nicht\n";
    }
}

