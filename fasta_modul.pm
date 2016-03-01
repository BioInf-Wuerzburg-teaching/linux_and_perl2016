#!usr/bin/perl
use warnings;
use strict;
use Data::Dumper;

package fasta_modul;

sub fasta_parser{
my $datei= $_[0];
open(FASTA,$datei) or die "$! damn!";

my %Fastahash;
my @ID_Spec;
my $seq;

while (<FASTA>){
    chomp;
    if($_ =~/>/){
	 
	@ID_Spec = split (/\s/,$_);
	 $seq = '';
    }
    else{
	
	$seq = $seq.$_;
	#print "$seq\n";
    }	
	$Fastahash{$ID_Spec[0]}={"spec" => $ID_Spec[1],
				   "seq" => $seq};
       
 };

close FASTA or die;

return %Fastahash;
}


1;
