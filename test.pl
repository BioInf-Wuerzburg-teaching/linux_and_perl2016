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

#print Dumper(\%sequences);

$wert1=$sequences{'>ID1'};
$wert2=$wert1->{"species"};
if ($wert2 eq "Mensch")
   {
       print "works \n";
   }
else
   {
       print "does not work \n";
   }

$wert3=$wert1->{"sequence"};
if ($wert3 eq "SUPERSTOFFWECHSELPREOTEINESWILLEINFACHNICHTENDEN")
   {
       print "also works \n";
   }
else
{
    print "does not work either \n";
}
