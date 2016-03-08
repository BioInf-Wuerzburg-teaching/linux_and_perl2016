use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_dna.txt";

my $parser= Fasta->new();

$parser->filename($file);

my @base_counts = $parser->count_bases();
print @base_counts;

