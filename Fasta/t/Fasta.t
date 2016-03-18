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

can_ok('Fasta', 'count_base');
my $file_Rosalind="t/fasta_Rosalind.fa";
my $fasta_Rosalind=new_ok('Fasta');
$fasta_Rosalind->filename($file_Rosalind);
$fasta_Rosalind->read();

my $counts = $fasta_Rosalind->count_base(">count_test");
my $realcounts=[20, 12, 17, 21];
is_deeply($counts, $realcounts, "correct counts");


can_ok("Fasta", "transcribe");
is($fasta_Rosalind->transcribe(">transcribe_test"), "GAUGGAACUUGACUACGUAAAUU", "transcribe Test");

can_ok("Fasta", "rev_comp");
is($fasta_Rosalind->rev_comp(">reverse_test"),"ACCGGGTTTT", "reverse complement Test");




done_testing();


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

