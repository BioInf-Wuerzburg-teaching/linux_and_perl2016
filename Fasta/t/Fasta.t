# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Fasta.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More;
BEGIN { use_ok('Fasta') };


can_ok('Fasta', 'new');
my $fasta=new_ok('Fasta');


can_ok('Fasta', 'filename');
my $file="t/fasta.fas";
is($fasta->filename($file), $file, "filenametest");
is($fasta->filename(), $file, "two");

can_ok('Fasta', '_open');
$fasta->_open();
my $fh=$fasta->{fh};
ok(tell($fh)!=-1, "filehandletest");

can_ok('Fasta', 'read');
$fasta->read();

can_ok('Fasta', 'get_seq');
is($fasta->get_seq(''), undef, "idtestfail");
is($fasta->get_seq(">ID1"),"AAAA", "idtest");

can_ok('Fasta', 'get_id');
my $expectedids=[">ID1"];
is_deeply($fasta->get_id(), $expectedids, "correct list of ids");

can_ok('Fasta', 'count_bases');

my $file1= "rosalind_dna.txt";

my $parser= Fasta->new();

$parser->filename($file1);

my @base_counts = $parser->count_bases();

my $counts1 = $base_counts[0];
my $counts2 = $base_counts[1];
my $counts3 = $base_counts[2];
my $counts4 = $base_counts[3];

my $concatenated_counts = $counts1 . $counts2;
my $concatenated_counts2 = $concatenated_counts . $counts3;
my $concatenated_counts3 = $concatenated_counts2 . $counts4;

is($concatenated_counts3 ,"226 230 232 241 ","base count test");

can_ok('Fasta', 'dna2rna');

my $file2= "rosalind_rna.txt";

my $parser2= Fasta->new();

$parser2->filename($file2);

my $rm_whitespaces = $parser2->dna2rna();

$rm_whitespaces =~ s/^\s+|\s+$//g;

is($rm_whitespaces,"AUAGUGUGUUGCAGGAUUUCCGGAGUCGAGUGAUAAUGAACGUUUACUGUGCUGAUAACCGGAAGAGCCGGCGUUAAGUCGCAAUGAAAAUCCACCGGAAAGCCUGAUAUCACUGCUCGACUAGACGACCUUGGGGGAAAUUCUCAUGAAAGCUCCCAUCUGCAGCAAAAUGAGUACAUUUAGCGUCGGUAGGCCUUGUGAUUUUAGAUGUGUUCGGGCGACCGCGGGAAAGACCCACCAAUCCCACAUGGAGACUAACGUAAACGAGGAUAACAGCAGCGGGCAAACGAUUGAGCCUUAUUGGCGAUUUAUCACAGACAGAAUCCAUAUGGCAUGUAUCUUCCUACGCCAUAUCUACAACCGAGGCGAGGCAACUGACACUAGAUCACGUGCUAAGAAUAAUCGUUCGAACGUAGGCUAAAAGGGCUAAUGCUAGUACUGAACCACCAUCAUUAGUUCUCAUAGUGUGCUGAAAGGAUCUUUGAGUGCGCUGAAAUUCCGUCCCUAAACACACGAAGCACUCAACUGUGCUUGGGUGAACUUUGUAGUAGGUAGACUGCCGAACUCGGGGAUCAGUCCGUCAUAGUGACCCAUGCGAGCUGUGGAGCAGACUACCGAAAAUGUUAGGACCGUCGUAAGCAGUACACACUUAGAACAAACGCUACACGCUGGAAAUAAAGCAGGCCCCAGCGCAUUUGACAUCCGACGUUUUUCAAAGUUAGUGUACCAGCCUUGAAGUCAAUAGCACCGUCAUUGAGCAUGAGGACAGCUCCAUCAUCCCGGCACCUGGAAAGCAGCGCGUAGACUGUGGCGGAUUUACUGAAGACGACAAUACUUCGCGGCCCGCGACACCCUCAUCACGUUUUUCCCAUCAGGCCUAAUAUAAAGAAACGACUCGCUCCAGUAUAUUAGGAUUGACCCAACAUUGCAGGAAGGUAUGCGUACAGCCAACACGGGAUUGUUAUUCCGAGUUCAGAUGAA", "dna2rna test");

can_ok('Fasta', 'reverse_complement');

my $file3= "rosalind_revc.txt";

my $parser3= Fasta->new();

$parser3->filename($file3);

my $reverse_complement = $parser3->reverse_complement();

$reverse_complement =~ s/^\s+|\s+$//g;

is($reverse_complement,"AACAGCTGGGGACCTCTGCACCACGTCTAGGGCTGTATCAGTGTTTGCAAAACACCCGTGCCCACATTCCTAACGCTACATCTTTATAGGCAGGAGGGCAGTTTGGCTGCATACTTAAAAAATGCTCAAGCGCATGGCATGGAATTCGACCAGTGATTAACGTTAAGTCTCGGTTGTTTGGATAATGCGCGGGAATTCGGAGTTCGGCTGAACAGACATACGCCTGGGTTTCCCCGTGAACCCCAAGAGGAAACCATCTTTAAACCAAAGGAGGATCATGACGGGGAGAGCACACGTCGGGGTCGGGGACGAGTTAAAGAAAAGACTAGGTCTCTACACGATCGGACTTTTTTATACACGTATAATGGGCCCAGGGTGGGCTCCTCCGACACTTCAGTTGATGAAAGCGTATCTCGATTAGAGGTAGGCTACATCATTATCATAGTTGAGTGTAGGTCAGGAATATCGCGAGCCAGTTTTCGGAGTATACTCTATAAGGCAGTGTCGGTGTCGGCTTAACCATGATAGGCTCCACCTGCGATCAATGCCAATTGGGGCGGTATTACGTTTCGCAATATTTCTCCTCTATGCGAGCTCGCGATAAACTGAAATTCACAACGACTCGGAAGAACTGATAGAGTAGGAACACCCGGGAAAGTCAAGCTGTTTAGTGATCCCGCGGAAACTATGAAACCCATTAAATATGACGACCGTGGGTGTCAGTAGCTCAAGAGGCGTAGATAGGCGCATAGCATCGTAACAAGTTCGTTATAACTGCTCTTACAGTTGAATCTATTGTACTCCCCGGCAAATCCTATTTTAGACTCATGGCGTACTCTACCCATGTTTAAAGGTAGACCTATGCGCAAGGCCTTGTCCAGCGTGAGTTCATGTGCGCTACTGGGCT", "test reverse complement");

can_ok('Fasta', 'put_zeile_into_array');

can_ok('Fasta', 'find_motif2');

my $file4= "rosalind_subs.txt";

my $parser4= Fasta->new();

$parser4->filename($file4);

my $result = $parser4->find_motif2();

is($result, "1 33 135 142 181 198 215 222 229 236 269 276 296 403 410 432 458 465 484 515 522 606 648 686 726 805 812 850 865 872 904 934 ","find motif test");

done_testing();


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

