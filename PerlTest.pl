use warnings;
#use strict;

$bla=7;
$bla='Hallo';

print "$bla World\n";      #Hallo Welt
print '$bla World',"\n";      #$bla Welt

$blub = 1+3;

# $blub = 1+$bla;   hoch lebe Warnings!

$two = 1;
$one = 2;

$ram = $two;
$two = $one;
$one = $ram;

print "One:$one\nTwo:$two\n";


$blub=$bla."Welt!";
$i=0;
$i=$i+1;
print $i."\n";


#############Arrays

@nichtbla = (1,2,"a","Hallo");
print @nichtbla;print"\n";      #12aHallo
print "@nichtbla\n";            #1 2 a Hallo

$nichtbla = $nichtbla[2];
print "$nichtbla\n";            # a

print $nichtbla,@nichtbla,"\n";      #a12aHallo

#Don't code with stupid Variable names!
$nichtbla[2]="b";
$nichtbla[4]="Welt";
#$nichtbla[100]=100;     #JustPerlThings
print @nichtbla,"\n";

foreach $whatever (@nichtbla) {
    print "$whatever\t";
}

foreach(@nichtbla){print;}  #prints $_
print "\n";
$last_index=$#nichtbla;   #Just for you Frank
$length=@nichtbla;       #Length

print $last_index,"\t",$length,"\n";    #4  5

$nichtbla[$length] = 8;
print "@nichtbla\n";

push @nichtbla, 8;      #push to the end
$lastone = pop @nichtbla; #takes the last value -> throws away in Array
$lastone = $nichtbla[@nichtbla-1];

$#nichtbla=$#nichtbla-1;      #shorts the Array by 1   #For Frank again #badbad

unshift(@bla, 8); #push at the begining of the array
$first = shift@nichtbla; #take the first 


for ($i=0;$i<7;$i++){
    #dosomething;
};

$i=0;
while($i<3){
    #dosomething;
    $i++
};

@bla=(1,2,'a','Hello');
$bla=@bla;
###array with for
print "\n\n";
for ($i=0; $i<@bla;$i++){
    print "$bla[$i]\n";
};

###### hash

%notblaagain(Human => 3,
	     Mouse => 7,
	     Fly => 9);

$Mouse_genes = $notblaagain{Mouse};
$notblaagain{Mouse} = 12;
$notblaagain{Worm} = 20;

foreach $key (keys %notblaagain){
    print $key,$notblaagain{$key},"\n";
}
