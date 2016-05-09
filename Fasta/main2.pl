use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "t/fasta.fas";

my $parser= Fasta->new();

$parser->filename($file);
$parser->read();
foreach my$ID (@{$parser->get_id()}){
	print $ID, "\n", $parser->get_seq($ID), "\n";
}
