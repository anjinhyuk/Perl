#run this program until say no!
while (1) {
	#Intro
	print "###### AUCTION GAME ######\n";
	print "      <RULE>\n";
	print "* You may bid up to five valuable paintings.\n";
	print "* Start with \$5000.\n";
	print "* Then, try to sell your collection for as much as possible.\n";
	print "* If you finsh with more than \$5000 then you win this game!\n\n\n";
	#prepare empty array and default value of cash
	@pic = ();
	$cash = 5000;
	#start bidding there are five
	for ($i=1; $i<6; $i++) {
		print "\n    -PICTURE #$i- \n";
		print "How much do you want to do you want to use for this picture? ";
		chomp ($bid = <STDIN>);
		#random price of other's bid
		$price = int(rand(1000)+150);
		#if I win then get the picture
		if ($bid >= $price) {
			$cash = $cash - $bid;
			push (@pic, $bid);
			print "You got this! You spent \$$bid. Now you have \$$cash.\n"
		} else {print "Someone bid for \$$price. Sorry You cannot get this.\n";
		}
	}
	#last balance after last auction
	print "\n You have \$$cash left!";
	$bal = $cash;
	$count = int(rand(5)+1);
	$j=1;
	#selling part
	print "\n\n <SELLING> \n";
	foreach $x (@pic) {
		print "\nYou may now sell your painting #$j\n";
		#offered prices for the pictures you bought
		#if you don't like offer, there are more
		for ($k=0;$k<$count;$k++) {
			$bid2 = int(rand(2000)+500);
			print "You've been offered \$$bid2 for this painting.\n"; 
			print "You paid \$$x for it do you accept? (y/n)  ";
			chomp ($ans = <STDIN>);
			if 	($ans eq "y") {
				$bal += $bid2;
				print "Nice Choice! Now you have \$$bal!\n\n";
				last;
			} else {
				print "You didn't sell it! Now you have \$$bal!\n\n";
			}
		}
		print "\nSorry, that was the last offer. You have to keep that painting!\n\n";
		$j++;
	}
	#after all offers finish the program with the money
	
	print "you started with \$5000. You finish with \$$bal! ";
	#more than 5000 then win
	if ($bal > 5000) {
		print "YOU WON!!\n";
	} else {
		print "YOU LOST!!\n"}
	print "Play again? (y/n)  ";
	# if you say yes then run the program again
	chomp ($ans2 = <STDIN>);
	if ($ans eq "y") {
		redo;
	} else {
		last;
	}
}