//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	      /*Command*/		                      /*Update Interval*/	        /*Update Signal*/
	{" ",            "$(pamixer --get-mute) && echo -n \" \" || echo -n \" \" && pamixer --get-volume", 0, 2},
	{"",            "date '+%b %d (%a) %H:%M'",					60,		                      1},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
