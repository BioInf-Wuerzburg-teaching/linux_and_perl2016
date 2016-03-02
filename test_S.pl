#!usr/bin/perl
use warnings;
use strict;
use fasta_modul;

my $datei = "fasta.fa";  #laden der Datei

my %fastatest=fasta_modul::fasta_parser($datei); #übergeben an sub


#Test 1 Species

if($fastatest{">seq3"}{"spec"} eq "Maus" && $fastatest{">seq1"}{"spec"} eq "Mensch"){
    print "Test bestanden!(Spec)\n";
}
else{
    print "Sechs setzen!\n";
};

#Test 2 Sequence

if($fastatest{">seq2"}{"seq"} eq "CTGAGTTTTT" && $fastatest{">seq1"}{"seq"} eq "CTAGTGTTTT"){
    print "Test2 bestanden!(seq)\n"
}
else {
    print "Sechs setzen!\n";
};






