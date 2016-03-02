#!usr/bin/perl
use warnings;
use strict;
use fasta_modul;
use Test::More tests => 6;   #tests => 6   Legt anzahl der geplanten Tests fest

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



# With Test::More
# is ($got, $expected, $name);


require_ok ( 'fasta_modul');
can_ok ('fasta_modul', 'fasta_parser');

is ($fastatest{">seq3"}{"spec"}, "Maus", "Test_spec_Maus"); 

is ($fastatest{">seq1"}{"spec"}, "Mensch", "Test_spec_Mensch");

is ($fastatest{">seq1"}{"seq"}, "CTAGTGTTTT", "Test_seq_Seq1");

is ($fastatest{">seq2"}{"seq"}, "CTGAGTTTTT", "Test_seq_Seq2");
