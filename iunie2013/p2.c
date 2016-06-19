#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
  int i, n;
  int b2a = open("b2a", O_WRONLY);
  int a2b = open("a2b", O_RDONLY);

  printf("%d\n", n);
  for(i=0; i<3; i++) {
    read(a2b, &n, sizeof(int));
    printf("%d\n", n);
    n++;
    write(b2a, &n, sizeof(int));
  }

  close(a2b); close(b2a);
  return 0;
}
