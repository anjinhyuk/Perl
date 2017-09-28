#!/usr/bin/perl

sub drawRow {
    

my $star = $_[0];
	for ($i = 0; $i < $star; $i++){
	print "*";
	}
	print "\n";
	}

$player = 2;

while(1){

@star = (1,8,3,1);
$total = 13;
		
# drawRow
while($total > 0 ) {
		print "1 : ";
		drawRow($star[0]);
		print "2 : ";
		drawRow($star[1]);
		print "3 : ";
		drawRow($star[2]);
		print "4 : ";
		drawRow($star[3]);
		
		if ( $player == 1 ){ 
			$player = 2;
		}
		else { $player = 1} ;
		
		#ask for pile
		print "Player $player, which pile do you want to take shells from?";
		chomp ($pile = <STDIN>);

			if ($pile > 4 || $pile < 1 ){
				print "You think you are funny eh?! Please re-enter a number between 1 - 4."; 
				print "\n";
				redo;
				print "\n";
				}
			$pile--;
		
		#ask for shell
		print "Player $player, how many shells do you want to take out from?";
		chomp ($shell = <STDIN>);
				
				if($shell < 0 || $shell > $star[$pile]){
					print "You think you are funny eh?!"; 
					print "\n";
					
				}

				if ( $player == 1 ){
				$total -= $shell;
				}

				
				if ( $player == 2 ){
				$total -= $shell;
				}
				
				if ( $total == 0 ) {
				last;
				}

				
				$star[$pile] -= $shell;
}
		#replay 
		print "Player $player WIN! Do you want to play this again!? (Y/N)";
		chomp ($play = <STDIN>);
		if ( $play == "Y") {
		}
		
		else {
		last;
		}
		
	}
	

