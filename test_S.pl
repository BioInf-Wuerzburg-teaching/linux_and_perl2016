#!usr/bin/perl
use warnings;
use strict;
use fasta_modul;

my $datei = "fasta.fa";

my %fastatest=fasta_modul::fasta_parser($datei);

if($fastatest{">seq3"}{"spec"} eq "Maus"){
    print "Test bestanden!(Spec)\n";
}
else{
    print "Sechs setzen!\n";
};


if($fastatest{">seq2"}{"seq"} eq "CTGAGTTTTT"){
    print "Test2 bestanden!(seq)\n"
}
else {
    print "Sechs setzen!\n";
}






