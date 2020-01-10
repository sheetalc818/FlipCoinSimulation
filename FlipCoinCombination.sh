#!/bin/bash -x
echo "===FlipCoin Simulation==="

#Variable
flipCount=0;
countHeads=0;
countTails=0;
percentHead=0;
percentTail=0;

#Dictionary
declare -A Combination

#Taking No. of Coin count from user
read -p "How many Coins You want to flip :" coinCount

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

#To find Heads or Tails for single coin
function getFlip()
{
	#No. of coin
	local count=$1
	#Flip count
	local no=$2
   H=0
   T=0

	for (( i=0; i<$no; i++ ))
	do
	  coin=""
		for (( j=0; j<$count; j++ ))
		do
			if [ $((RANDOM%2)) -eq 1 ]
			then
				coin=$coin"H"
				((countHeads++))
			else
				coin=$coin"T"
				((countTails++))
			fi
		done
		echo $coin
		Combination[$coin]=$(( ${Combination[$coin]} + 1))
	done
	echo "================================================"

	#Printing value from dictionary
	for coin in ${!Combination[@]}
	do
		echo $coin ${Combination[$coin]}
	done

	#Calling calPercentage function
	calPercentage $countHeads $countTails $flipCount
}

#Calling getFlip function
getFlip $coinCount $flipCount



