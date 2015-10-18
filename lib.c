
/* Basic libraries for compiler */

#include <stdio.h>
#define X  1

int printd( int d ) {
  return printf( "%d", d );
}
int get_char_at( char *s, int i ) {
  return s[i];
}
int put_char_at( char *s, int i, int c ) {
  s[i] = c;
  int x = X;
  return c;
}
