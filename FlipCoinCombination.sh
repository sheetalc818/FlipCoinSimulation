#!/bin/bash -x
echo "===FlipCoin Simulation==="

#UC1-Flipping a Coin to Display Heads or Tails 

#((RANDOM)) to find Heads or Tails
function getFlip()
{
	if [ $((RANDOM%2)) -eq 1 ]
	then
		echo "HEAD"
	else
		echo "TAIL"
	fi
}

#Calling getFlip function
getFlip
