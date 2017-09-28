#parameters are numbers I need
$n = $ARGV[0];
$r = $ARGV[1];
 
#type more than 3 or less than 2 numbers fail
if (@ARGV == 0) {
    die "Error: must supply two numbers, n and r\n";
} elsif ($r == 0) {
	die "Error: must supply two numbers, n and r\n";
}

#factorial subroutine
sub factorial {
    my $n = $_[0]; #use them as a parameter
    if ($n == 0) {
        return 1;
    } else {
        return $n * factorial($n-1);
    }
}
#permutation subroutine with original formula
sub perm1 {
	my $num1 = $_[0];
	my $num2 = $_[1];
	$fact1 = factorial($num1) / factorial ($num1-$num2);
	print "$fact1";
}
#permutation subroutine with using for loop
sub perm2 {
	my $num3 = $_[0];
	my $num4 = $_[1];
	$result = 1;
	for ($i = 0; $i<$num4; $i++) {
		$result *= ($num3-$i);
	}
	print "$result";
}

#print the result
print "P ($n, $r) using factorials : ";
perm1($n,$r);
print "\nP ($n, $r) using interation : ";
perm2($n,$r);