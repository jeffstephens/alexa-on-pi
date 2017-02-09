#!/bin/bash

# start node auth server
cd /home/pi/workspace/alexa-avs-sample-app/samples/companionService/ && npm start &

# start Alexa client
cd /home/pi/workspace/alexa-avs-sample-app/samples/javaclient && mvn exec:exec &

# wait for Alexa client to boot up
sleep 60

# authenticate Alexa client with Amazon
export DISPLAY=:0
sleep 5

# click "yes" to authentication request in Alexa client
#/usr/bin/xdotool mousemove 320 220
#/usr/bin/xdotool click 1

# select and copy authentication URL from Alexa client
/usr/bin/xdotool mousemove 213 150 # move mouse to location of link
/usr/bin/xdotool click --repeat 3 1 # triple click to select entire link
/usr/bin/xdotool key ctrl+c # ctrlc to copy link to clipboard
/usr/bin/xdotool mousemove 310 215 # move mouse to "yes" button
/usr/bin/xdotool click 1 # click "yes" button
sleep 2
/usr/bin/xdotool mousemove 70 22 # mouse over web browser
/usr/bin/xdotool click 1 # launch web browser
/usr/bin/xdotool key ctrl+l # focus address bar
/usr/bin/xdotool key ctrl+v # paste link
#/usr/bin/xdotool key Return
sleep 10 # wait for Amazon auth page to load
/usr/bin/xdotool mousemove 800 450 # mouse over "continue" link
/usr/bin/xdotool click 1
sleep 10 # wait for Continue request to complete
/usr/bin/xdotool key ctrl+w # close browser, we are done there
sleep 5 # make sure the window is cleaned up
/usr/bin/xdotool key Return # click "OK" on Alexa client

# launch wakeword agent to listen for "Alexa" hotword
cd ~/workspace/alexa-avs-sample-app/samples/wakeWordAgent/src && ./wakeWordAgent -e kitt_ai &

