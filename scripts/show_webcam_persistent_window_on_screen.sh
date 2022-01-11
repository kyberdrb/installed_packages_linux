#!/bin/sh

# Select webcam device with resolution and input format
v4l2-ctl --list-devices
ffmpeg -f video4linux2 -list_formats all -i /dev/video0
v4l2-ctl --list-devices | grep -v "^$" | grep -v ":" | sed 's/^\s*//g' | tail -n 4 | xargs -0 -I % sh -c 'ffmpeg -f v4l2 -list_formats all -i %'
mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o=video_size=320x240,input_format=yuyv422 --vf=hflip av://v4l2:/dev/video0 --profile=low-latency --untimed --hwdec=auto &

# Wait for the player window to show
sleep 1

# Set window always on top
window_id_for_mpv="$(wmctrl -lvG | grep mpv$ | cut -d' ' -f1)"
wmctrl -i -r "$window_id_for_mpv" -b add,above

# Move window to the lower left corner - for 1920x1080 screen resolution
screen_resolution=$(xdpyinfo | grep 'dimensions:' | cut -d ':' -f 2 | sed 's/^\s*//g')
screen_resolution_width=$(echo "$screen_resolution" | cut -d'x' -f1)
screen_resolution_height=$(echo "$screen_resolution" | cut -d'x' -f2 | cut -d' ' -f1)

window_info=$(xwininfo -id "$(xdotool getactivewindow)")
window_width=$(echo "$window_info" | grep "Width" | tr -d '[:space:]' | cut -d':' -f2)
window_height=$(echo "$window_info" | grep "Height" | tr -d '[:space:]' | cut -d':' -f2)

window_side_and_lower_decorator_border_width=$(echo "$window_info" | grep "Relative upper-left X" | tr -d ' ' | cut -d':' -f2)
window_position_top_right_corner_without_top_decoration_X=$(( screen_resolution_width - window_width - window_side_and_lower_decorator_border_width ))
window_position_top_right_corner_without_top_decoration_Y=$(( screen_resolution_height - window_height - window_side_and_lower_decorator_border_width ))

xdotool getwindowfocus windowmove "$window_position_top_right_corner_without_top_decoration_X" "$window_position_top_right_corner_without_top_decoration_Y"

