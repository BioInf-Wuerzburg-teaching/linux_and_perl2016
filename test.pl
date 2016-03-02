use strict;
use warnings;
use fasta_kram;
use Test::More;

#use Data::Dumper;


my $test='fasta';
my %hash=fasta_kram::fasta_parser($test);

#print Dumper (\%hash);

if ($hash{'>ID245335'}->{species} eq 'Mensch')
    {
	print "Passt! \n";
    }
else
    {
	print "failed \n";
    }


is ($hash{'>ID245335'}->{species},'Mensch',"test_spec");
is ($hash{'>ID245335'}->{sequence},'DJFHEMXDDFJIKDICDCIDLCMD',"test_seq");
