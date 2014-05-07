/* The height of the bar (in pixels) */
#define BAR_HEIGHT  18
/* The width of the bar. Set to -1 to fit screen */
#define BAR_WIDTH   -1
/* Offset from the left. Set to 0 to have no effect */
#define BAR_OFFSET 0
/* Choose between an underline or an overline */
#define BAR_UNDERLINE 1
/* The thickness of the underline (in pixels). Set to 0 to disable. */
#define BAR_UNDERLINE_HEIGHT 2
/* Default bar position, overwritten by '-b' switch */
#define BAR_BOTTOM 0
/* The fonts used for the bar, comma separated. Only the first 2 will be used. */
//#define BAR_FONT       "-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1","fixed"
#define BAR_FONT       "-lucy-tewi-medium-*-*-*-*-*-*-*-*-*-*-*","fixed"

/* Some fonts don't set the right width for some chars, pheex it */
#define BAR_FONT_FALLBACK_WIDTH 6
/* Define the opacity of the bar (requires a compositor such as compton) */
#define BAR_OPACITY 1.0 /* 0 is invisible, 1 is opaque */
/* Color palette */
#define BACKGROUND 0x0d131c
#define FOREGROUND 0xb3b2b5

#define COLOR0 0x251f1f
#define COLOR8 0x5e5e5e
#define COLOR1 0xff0b00
#define COLOR9 0xed525b
#define COLOR2 0x41a45a
#define COLOR3 0xf44600
#define COLOR4 0x1a96c0
#define COLOR5 0xdf115c
#define COLOR6 0x008788
#define COLOR7 0xb3b2b5
