$file = $ARGV[0];

if (@ARGV == 0) {
	die "write down filename!\n";
}

open (INPUT,$file) or die "wrong file!\n";
@stat = <INPUT>;
close INPUT;

foreach $scott (@stat) {

	chomp $scott;
	#chop words by space
	@proof = split(" ", $scott);
	$count = @proof;
	
	#If there is only a word or end with a question mark, no statement
	if ($count == 1 or $scott =~ /\?$/){
		$st = uc "not a statement!";
	#If there are pronounces, no statement
	} elsif ($scott =~ /he/i || $scott =~ /she/i || $scott =~ /it/i || $scott =~ /they/i){
		$st = uc "not a statement!";
	#If there are question words, no statement
	} elsif ($scott =~ /what/i || $scott =~ /where/i || $scott =~ /how/i || $scott =~ /why/i || $scott =~ /who/i || $scott =~ /when/i){
		$st = uc "not a statement!";
	} else {
		$st = uc "statement!";
	}
	print "$scott ==> $st\n";
} 

	
