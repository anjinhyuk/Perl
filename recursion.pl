#bring the file in to the program
$file = $ARGV[0];

if (@ARGV == 0) {
	die "write down filename!\n";
}

open (INPUT,$file) or die "wrong file!\n";
@A = <INPUT>;
close INPUT;

#compare numbers which one is larger
sub divide {
	my $p = $_[0];
	my $r = $_[1];
	my $x = $A[$r];
	my $i = $p-1;

        for ($j = $p; $j <= $r-1; $j++) {
            if ($A[$j] <= $x) {
                $i++;
				#exchange numbers
				($A[$i], $A[$j]) = ($A[$j], $A[$i]);
            }
        }
	($A[$i+1], $A[$r]) = ($A[$r], $A[$i+1]);
    return ($i+1);
}


#sort or numbers in order
sub sort205 {
	my $p = $_[0];
	my $r = $_[1];
    if ($p < $r) {
        $q = divide($p,$r);
        sort205($p, $q-1);
        sort205($q+1, $r);
    }
}

#actually sort all numbers
$scott = @A;
sort205(0, $scott-1);

#ultimately print the array
foreach $b (@A) {
	print "$b";
}