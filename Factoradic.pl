#!/usr/bin/perl

use POSIX;
# Program to find nth unique Permutation of a combination.

#my @InputArray=(0,1,2,3,4,5,6); 
my @InputArray=('A','B','C','D','E','F','G','H');
my $factoradic =(0) x @InputArray;

	my $len=$#InputArray;
	my $pos=$ARGV[0];  # Nth Combination
	my $numdigit=1;

	if($pos  > factorial(9))
	{
		print "Enter value less than factorial(9)\n";
		exit;
	}
	while (factorial($numdigit) < $pos){ $numdigit++;}
	$numdigit--;

	print "Original Input = ",join(',',@InputArray)."\n";

	while($numdigit >=0)
	{
	# Break the position value (Decimal ) to factorial notation (!) and store in @factoradic
		$factoradic[$numdigit]= floor($pos/factorial($numdigit));
		$rem= $pos % factorial($numdigit);
		$pos=$rem;
		$numdigit--;
	}

	my $base=0;

	# Now start placing the combination based on @factoradic  array	
	while($base <=$len )
	{
		$ntharray[$base]=$InputArray[$factoradic[$len-$base]];
		#delete the element used
		splice(@InputArray,$factoradic[$len-$base],1);
		$base++;
	}

	print "Permutation at $ARGV[0] =".join(',',@ntharray)."\n";

sub factorial()
{
	my $val=shift;
	if($val <=1)
	{
		return 1;	
	}
	return $val*factorial($val-1);
}
