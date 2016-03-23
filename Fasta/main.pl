use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "t/fasta.fas";

my $parser= Fasta->new();

$parser->filename($file);
$parser->read();
#foreach my$ID (@{$parser->get_id()}){
#	print $ID, "\n", $parser->get_seq($ID), "\n";
#}

#print $parser->translate('>ID1');
#print "\n";

#print $parser->reverse_complement(">ID1");
#print "\n";


my @highGC=@{$parser->GC};
print "@highGC";
