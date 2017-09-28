#open file with parameter
$file = $ARGV[0];

#type file name
if (@ARGV == 0) {
	die "Wrong File!! Type again!\n";
}

#input correct file
open(INPUT, $file) or die "rename your file correctly!\n";
@input = <INPUT>;
close INPUT;

#split the input file by space
@A = split(" ", $input[0]);
@B = split(" ", $input[1]);
#use join to put comma in between the words
$a = join(",",@A);
$b = join(",",@B);
#print into set style
print "A = {$a}\n";
print "B = {$b}\n";

#intersection set by finding common value and put it into an array 
@intersection = ();
foreach $int1 (@A) {
	foreach $int2 (@B) {
		if ($int1 eq $int2) {
		 push (@intersection, $int1);
		}
	}
}
$int = join(",",@intersection);
print "A intersect B = {$int}\n";

#union set by put A value plus B value without intersection value
@union = ();
foreach $uni1 (@A) {
	push (@union, $uni1);
}
foreach $uni2 (@B) {
	if (!($uni2 ~~ @union)) {
		push @union, $uni2;
	}
}
$uni = join(", ",@union);
print "A union B = {$uni}\n";

#A-B set by taking out intersection value from set A
@AminusB = ();
foreach $min1 (@A) {
	if (!($min1 ~~ @intersection)) {
	push @AminusB, $min1;
	}
}
$Amin = join (", ", @AminusB);
print "A - B = {$Amin}\n";

#B-A set by taking out intersection value from set B
@BminusA = ();
foreach $min2 (@B) {
	if (!($min2 ~~ @intersection)) {
		push @BminusA, $min2;
	}
}
$Bmin = join (", ", @BminusA);
print "B - A = {$Bmin}\n";

#AxB set by using foreach to go over every single values in sets
@AxB = ();
foreach $i (@A) {
	foreach $j (@B) {
		push @AxB, "($i, $j)";
	}
}
$AB = join (", ",@AxB);
print "A x B = {$AB}\n";

#BxA set by using foreach to go over every single values in sets
@BxA = ();
foreach $i (@B) {
	foreach $j (@A) {
		push @BxA,"($i, $j)";
	}
}
$BA = join (", ",@BxA);
print "B x A = {$BA}\n";