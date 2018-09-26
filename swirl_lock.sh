#!/bin/bash

scrot /tmp/screenshot.png
convert /tmp/screenshot.png -paint 1 -swirl 360 /tmp/screenshot_ps.png
i3lock -i /tmp/screenshot_ps.png
