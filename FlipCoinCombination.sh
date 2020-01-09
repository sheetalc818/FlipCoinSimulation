#!/bin/bash -x
echo "===FlipCoin Simulation==="

#Variable
flipCount=0;
counter=0;
countHeads=0;
countTails=0;
percentHead=0;
percentTail=0;

#Dictionary
declare -A Combination

#Taking input from user
read -p "Enter How many times You want to flip Coin :" flipCount

#Calculating Percentage for Head and Tail
function calPercentage()
{
	percentHead=$((($countHeads*100)/$flipCount))
	echo "PercentHead:" $percentHead

	percentTail=$((($countTails*100)/$flipCount))
	echo "PercentTails: " $percentTail
}

#((RANDOM)) to find Heads or Tails
function getFlip()
{
	local count=$1
	while [ $count -ne 0 ]
	do
		if [ $((RANDOM%2)) -eq 1 ]
		then
			result="HEAD"
			Combination[$((counter++))]=$result
			((countHeads++))
		else
			result="TAIL"
			combination[$((counter++))]=$result
			((countTails++))
		fi
		((count--))
	done
	echo $countHeads $countTails
	
	#Calling calPercentage function
	calPercentage $countHeads $countTails $flipCount
}

#Calling getFlip function
getFlip $flipCount
