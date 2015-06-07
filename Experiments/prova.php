#!/usr/bin/php -q
<?php
	$PIPPO="pappo";
	$A=1;
	$B=2;
	$C= ($A+$B); 
	$D= $A.$B;
	echo "ciao\n";
	echo "$C\n$D\n";
	$$PIPPO="puntatore";
	echo "$pappo\n";
	$nero = & $bianco;
	$bianco = "giallo"; 
	echo $nero . "|Valore di bianco= $bianco\n";
	$bianco = "rosso";
	$vero=true;
	$falso=false;
	echo "\n";
	$string = <<<HTML
Ciao come stai 
io sto bene
E tu come stai
HTML;
echo "$string\n";
echo strtoupper($string)."\n";


#################################################

$info = array('coffee', 'brown', 'caffeine');

// Listing all the variables
list($drink, $color, $power) = $info;
echo "$drink is $color and $power makes it special.\n";

// Listing some of them
list($drink, , $power) = $info;
echo "$drink has $power.\n";

// Or let's skip to only the third one
list( , , $power) = $info;
echo "I need $power!\n";

// list() doesn't work with strings
list($bar) = "abcde";
var_dump($bar); // NULL
############################################

	
?>
