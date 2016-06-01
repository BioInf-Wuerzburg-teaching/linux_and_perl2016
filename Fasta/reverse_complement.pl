use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_revc2.txt";

my $parser= Fasta->new();

$parser->filename($file);

my $reverse_complement = $parser->reverse_complement();
print $reverse_complement;
