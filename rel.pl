#file input
$file = $ARGV[0];
#if don't put input then say this
if (@ARGV == 0) {
	die "Write down the name of file you want to input!!\n";
}

#check correct filename
open(INPUT,$file) or die "Incorrect name of file!";
@input = <INPUT>;
close INPUT;

#set printing part
@set = split(" ", $input[0]);
$x = join (",",@set);
print "Set : {$x}\n";

#make counts
$count1 = 0;
$count2 = 0;
$count3 = 0;
$a = 0;
foreach $p (@input) {
	$count1++;
}

#relation sprinting part
for ($i = 1; $i<$count1;$i++) {
	chomp($input[$i]);
	#put values of left and right into array to compare
	@tmp = split(" ", $input[$i]);
	push @L,$tmp[0];
	push @R,$tmp[1];
	#relation printing part
	$z = join(", ",@tmp);
	push @rel,"($z)";
	$y = join(", ",@rel);
}
print "Relation : {$y}\n";
#refelxive part
for ($j = 0; $j < $count1-1;$j++) {
	#check there are any equal pairs
	if($L[$j] eq $R[$j]) {
		$a++;
	}
}
foreach $q (@set) {
	$count2++;
}
if ($a == $count2) {
	print "Reflexive: Yes\n";
} else {
	print "Reflexive: No\n";
}

#symmetric part
for ($k=0;$k<$count1-1;$k++) {
	#prepare comparing parts
	$m = $L[$k];
	$n = $R[$k];
	for ($l=0;$l<$count1-1;$l++) {
		#if left and right pairs the same and one count up
		if ($m eq $R[$l] && $n eq $L[$l]) {
			$count3++;
		}
	}
}
#print result
if ($count3 == @L) {
	print "Symmetric : Yes\n";
} else {
	print "Symmetric : No\n";
}
