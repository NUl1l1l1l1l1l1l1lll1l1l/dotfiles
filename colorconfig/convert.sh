#!/bin/bash

# Define the input file
input_file="colors"

# Read the input file and process the color definitions
declare -A colors
while IFS='=' read -r key value; do
  if [[ $key =~ ^[A-Z]+$ ]]; then
    colors[$key]=$value
  fi
done < "$input_file"

# Convert colors to the format used in the colors.h
cat <<EOF > colors.h
const char *colorname[] = {

  /* 8 normal colors */
  [0]  = "${colors[BLACK]}",   /* black   */
  [1]  = "${colors[RED]}",     /* red     */
  [2]  = "${colors[GREEN]}",   /* green   */
  [3]  = "${colors[YELLOW]}",  /* yellow  */
  [4]  = "${colors[BLUE]}",    /* blue    */
  [5]  = "${colors[MAGENTA]}", /* magenta */
  [6]  = "${colors[CYAN]}",    /* cyan    */
  [7]  = "${colors[WHITE]}",   /* white   */

  /* 8 bright colors */
  [8]  = "${colors[BBLACK]}",  /* black   */
  [9]  = "${colors[BRED]}",    /* red     */
  [10] = "${colors[BGREEN]}",  /* green   */
  [11] = "${colors[BYELLOW]}", /* yellow  */
  [12] = "${colors[BBLUE]}",   /* blue    */
  [13] = "${colors[BMAGENTA]}",/* magenta */
  [14] = "${colors[BCYAN]}",   /* cyan    */
  [15] = "${colors[BWHITE]}",  /* white   */

  /* special colors */
  [256] = "${colors[CURSOR]}",      /* cursor */
  [257] = "${colors[RCURSOR]}",     /* reverse cursor */
  [258] = "${colors[FOREGROUND]}",  /* fg */
  [259] = "${colors[BACKGROUND]}",  /* bg */
};
EOF

echo "colors.h has been generated successfully."

