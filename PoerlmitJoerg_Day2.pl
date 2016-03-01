use warnings;
#use strict;

#Pörl mit Jörg - Day 2

#weitergehts mit Hashes *yeah*

#Memory:  #Referenzen!
@genes_Mouse=("P53","P7");
$genref_Mouse = \@genes_Mouse;
#"Entpacken"
@genes = @{$genref_Mouse};         

$genref_Human["P53","GenXY"];   #anonyme Ref 



%hash =(Mouse => $genref_Mouse,
	Human => $genref_Human};


###### Usage

%length = ("P53" => 7,
	   "P7" => 9);

$ref_length = \%length;

%L2 = %{$ref_length};

$lengthP53 = $L2{"P53"};

####more!

%gene_list = ("Mouse" => $ref_length);

#########Let's get anonym! 

$ref_length2={"P53"=>7,
	      "P7"=>9};

$ref_arr[1,2,3,4];


%gene_list = ("Mouse" => {"P53" => 7,
			  "P7" => 9},
	      "Human" => {"P53" => 9,
			  "P7" => 7});
########Zugriff auf Anonyme Refs
$x = $ref_length2->{"P53"};                     #Lesen
$y = $ref_arr->[1];

$ref_arr->[1] = 9;                              #Setzen

$blaagain = $gene_list{Mouse};                  #Ref auf Hash

$yeahBla = $gene_list{"Mouse"}->{"P7"};         #Lesen
$gene_list{"Mouse"}->{"P7"} = 11;               #Setzen

 
#Swissprot!
#
#%swis=("Acc" => {seq => 'PLTWLV',
#		 spec => 'Mus',
#		 ref => [$PMDI1, $PMDI2]}
#       "Acc2 => AND SO ON!
#
# All in one Structure
# Zugriff -> $id = %swiss{Acc2}->{ref}->[1];
#


#### DATEIN EINLESEN

$datei = 'swiss.fasta';

open(FILEHANDLE,$datei) or die "$!";

while(<FILEHANDLE>){
    $zeile= $_;
    print $zeile;
};

close FILEHANDLE or die "$!";

#### PATTERN

if($zeile=~/>/){     #Header
    @elements = split(/ /,$zeile);
}
else {
    
};





