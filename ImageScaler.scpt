-- Script by Apple Inc.
-- Modified by Jonas Huesser 
-- 8th dec 2014
-- http://jonas.xn--hsser-kva.ch


set boo to 0 -- boolean value
set n to 0 -- counter value
repeat until boo is 1
	display dialog "How many files do you want to scale?" default answer "1" buttons {"Cancel", "Next"} default button 2 with title "Enter an integer" with icon note -- ask how many files to scale
	copy the result as list to {button_pressed_Files, text_returned_Files}
	
	display dialog "What should be the longer site of the image?" default answer "500" buttons {"Cancel", "Start"} default button 2 with title "Enter an integer" with icon note -- ask how long the longer site should be
	copy the result as list to {button_pressed_Pixels, text_returned_Pixels}
	
	try
		set i to text_returned_Files as number -- transform from string to integer
		set boo to 1
	on error
		display dialog "Error -1700. Enter an integer." buttons {"OK"} default button 1 with title "Error -1700" with icon caution -- if you didn't enter a number...
	end try
	
	try
		set px to text_returned_Pixels as number -- transform from string to integer
		set boo to 1
	on error
		display dialog "Error -1700. Enter an integer." buttons {"OK"} default button 1 with title "Error -1700" with icon caution -- if you didn't enter a number...
	end try
	
	
end repeat
if button_pressed_Files is "Cancel" then
	
	return --If pressed cancel, script will quit
	
	
else
	
	
	
	
	repeat until i = n -- says how many files to scale
		set theImage to choose file with prompt "Choose the file." -- chosse the image
		tell application "Image Events"
			set this_image to open theImage -- opens image
			scale this_image to size px -- scales the image
			save this_image in theImage -- saves the image
			close this_image -- closes the image
		end tell
		set n to n + 1 -- counts
	end repeat
	
	display dialog "Succesful." buttons {"Close"} default button 1 with title "Succesful." with icon note -- succesful
end if
