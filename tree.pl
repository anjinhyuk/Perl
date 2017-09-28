#bring file into program
$file = $ARGV[0];
if (@ARGV == 0) {
	die  "FILE NAME PLEASE!";
	}
	
open(INPUT, $file) or die "WRONG NAME!";
@input = <INPUT>;
close INPUT;

#preparation for stacks
@stack=();
$d = -1;

#split input by enters
foreach $p (@input) {
	#split input by spaces
	@in = split(" ", $p); 
	chomp (@line);
	#Input printing
	print "Input : @in\n";
	#calculation algorithm
	foreach $e (@in) {
		#adding
		if ($e eq "+") {
			#bring up two number in the stack array
			$b = pop @stack;
			$a = pop @stack;
			$c = $a + $b;
			#store result into stack array
			push @stack, $c; 
		#subtracting
		} elsif ($e eq "-") {
			$b = pop @stack;
			$a = pop @stack;
			$c = $a - $b;
			push @stack, $c;
		#multiplying 
		} elsif ($e eq "*") {
			$b = pop @stack;
			$a = pop @stack;
			$c = $a * $b;
			push @stack, $c;
		#dividing
		} elsif ($e eq "/") {
			$b = pop @stack;
			$a = pop @stack;
			$c = $a / $b;
			push @stack, $c;
		#if it is number put into stack array 
		} else {
			push @stack, $e;
		}
		
	}
	$d++;
	#print result
	print "Result : $stack[$d]\n\n";
}