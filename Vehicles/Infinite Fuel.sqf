/*
*	Just paste this in the vehicle init field or the script box of Zeus enhanced.
*	Change the number to increase how many times we set the fuel to 100% -> Do this if the vehicle runs out of fuel with the base 15 seconds.
*/

[_this] spawn { 
 	while {true} do { 
 		_this#0 setFuel 1; 
 		sleep 15; //Wait 15 Seconds before changing the fuel value again -> Saves Computation time.
	};
};