#!usr/bin/perl
use warnings;
use strict;
use Roboter_module;
use Data::Dumper;

my $C3PO = Roboter_module->new();

$C3PO->arm_change("rechts","oben");
$C3PO->move(1,5);

print Dumper($C3PO);


