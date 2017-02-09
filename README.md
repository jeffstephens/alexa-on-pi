# alexa-on-pi

Configuration for running a somewhat-functional Amazon Alexa interface on a Raspberry Pi with a USB microphone and speaker

This repository contains the scripts I wrote and configuration changes I made to get Alexa running. The wake word "Alexa"
triggers the prompt, and most features other than streaming music work, including the Flash Briefing.

## First, the normal setup

Follow the instructions here: https://github.com/alexa/alexa-avs-sample-app/wiki/Raspberry-Pi

This will get you most of the way there. Make sure that when you login to your Amazon account, you tell the browser
to remember your password or the auto-launch feature won't work. If you're concerned about security, consider creating
a secondary Amazon account just to use for this project.

## Autostart on boot

Most of the existing solutions don't support auto-launching the Alexa stack on boot. I do not claim to have an elegant
or even good solution; it merely works for now - and could easily break in the future.

It leverages `xdotool` to automate the UI interactions required to get the Alexa software running. It assumes you have
set the browser to remember your Amazon password, so that all is needed is a click of the "continue" button. This will
only work after you follow the normal instructions to get Alexa running. 

After you've got it running manually, copy the `autostart-alexa.desktop` file to the following location:

    ~/.config/autostart/autostart-alexa.desktop

This script will assume you've cloned this repository at `/home/pi/workspace/` - so either do that, or change the
path to the script in `autostart-alexa.desktop`.

