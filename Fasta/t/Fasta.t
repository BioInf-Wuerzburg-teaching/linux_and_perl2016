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
#is($fasta->count_bases(),"212 206 225 231","base count test");

can_ok('Fasta', 'dna2rna');

can_ok('Fasta', 'reverse_complement');

can_ok('Fasta', 'put_zeile_into_array');

done_testing();


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

