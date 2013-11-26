#!/usr/bin/perl

use POSIX;
# Program to find nth unique Permutation of a combination.

my @BaseArray=(0,1,2,3,4,5,6,7,8,9);
#my @newarray=(0,1,2,3,4,5,6);
my @InputArray=('A','B','C','D','E','F','G','H');
my @factorial;

	print "Original Input = ",join(',',@newarray)."\n";
my $len=$#InputArray;

$factorial[0]=1;


#Get factorial in a array
foreach my $i (@BaseArray)
{
	if($i != 0)
	{
		$factorial[$i]=$i*$factorial[$i-1];
	}
}

my $pos=$ARGV[0];  # Nth Combination
my $i=1;

if($pos  > $factorial[9])
{
	print "Enter value less than $factorial[9]\n";
	exit;
}
while ($factorial[$i] < $pos)
{
	$i++;
}
$i--;

my $Maxdigit=$i; # Max factoroid we are going to use/generate.

while($Maxdigit++ < $len)
{
	# Reset extra factoroid = 0 
	$factorid[$digit]=0;
}

$Maxdigit=$i;

while($i>=0)
{
	# Break the position value (Decimal ) to factorial notation (!) and store in @factoradic
	$factoradic[$i]= floor($pos/$factorial[$i]);
	$rem= $pos % $factorial[$i];
	$pos=$rem;
	$i--;
}

	my $base=0;

	# Now start placing the combination based on @factoradic  array	
while($base <=$len )
{
	$ntharray[$base]=$InputArray[$factoradic[$len-$base]];
	#delete the element used
	for ($i=$factoradic[$len-$base];$i<$#InputArray;$i++)
	{
		$InputArray[$i]=$InputArray[($i+1)];
	}
	pop(@InputArray);
	#print "Temp array= @newarray ($#newarray)\n New array =@ntharray\n";
	$base++;
}

print "Permutation at $ARGV[0] =".join(',',@ntharray)."\n";
