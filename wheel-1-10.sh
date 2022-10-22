#!/bin/bash

if [ ! -f ~/.imwheelrc ]
then
cat >~/.imwheelrc<<EOF
".*"
None,      Up,   Button4, 1
None,      Down, Button5, 1
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
EOF
fi

# Altering between 1 and 10. You can choose as you like

CURRENT_VALUE=$(awk -F 'Button4,' '{print $2}' ~/.imwheelrc)
NEW_VALUE=1

if [[ "$CURRENT_VALUE" -lt 10 ]]
then
	NEW_VALUE=10
fi

sed -i "s/\($TARGET_KEY *Button4, *\).*/\1$NEW_VALUE/" ~/.imwheelrc # find the string Button4, and write new value.
sed -i "s/\($TARGET_KEY *Button5, *\).*/\1$NEW_VALUE/" ~/.imwheelrc # find the string Button5, and write new value.
imwheel -kill
