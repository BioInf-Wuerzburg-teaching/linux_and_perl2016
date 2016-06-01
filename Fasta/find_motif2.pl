use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_subs2.txt";

my $parser= Fasta->new();

$parser->filename($file);

my @result = $parser->find_motif2();
print "@result";
