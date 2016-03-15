use strict;
use warnings;
use lib "./lib/";
use Fasta;

my $file= "rosalind_subs.txt";

my $parser= Fasta->new();

$parser->filename($file);

my $result = $parser->find_motif2();
print "$result";

#my @found=$parser->find_motif();
#if (@found) {
 #   local $" = ' ';
    #print 'Substring found ' . @found . " time(s) at: @found\n";
 #   print "@found\n";
#}
#else {
#    print "Substring not found.\n";
#}


