$file = $ARGV[0];

if (@ARGV == 0) {
	die "type again!\n";
}

#I want to link to file after the program name
open(INPUT, $file) or die "redirect your file!\n";
@letter = <INPUT>;
close INPUT;

$count = 0;

#split all in space
foreach $scott (@letter) {
	
	@eight = split(" ", $scott);
	
#count eights
	foreach $i (@eight) {
		if ($i == 8) {
			$count++;
		}	
	}
}

print "there are $count 8s in the text!";