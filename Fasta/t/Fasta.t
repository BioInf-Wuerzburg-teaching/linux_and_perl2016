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
is($fasta->get_seq(">ID1"),"AAAATTTCCGGG", "idtest");

can_ok('Fasta', 'get_id');
my $expectedids=[">ID1"];
is_deeply($fasta->get_id(), $expectedids, "correct list of ids");

can_ok('Fasta', 'basecount');
my %expectedcounts=(A=>4,C=>2,T=>3,G=>3);
my $exphash= \%expectedcounts;
is_deeply($fasta->basecount(">ID1"), $exphash, "correst counthash"); 

can_ok('Fasta', 'get_counts');


can_ok('Fasta', 'translate');
my $exprna="AAAAUUUCCGGG";
is($fasta->translate(">ID1"), $exprna, "translationtest");

can_ok('Fasta', 'reverse_complement');
my $exprev="CCCGGAAATTTT";
is ($fasta->reverse_complement(">ID1"), $exprev, "reversetest");

can_ok('Fasta', 'rna_translation');

done_testing();


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

