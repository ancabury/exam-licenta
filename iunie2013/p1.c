#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
  int i, n=1;
  int a2b = open("a2b", O_WRONLY);
  int b2a = open("b2a", O_RDONLY);

  for(i=0; i<3; i++) {
    if(fork() == 0) {
      // in the child
      n += i;
      write(a2b, &n, sizeof(int));
      read(b2a, &n, sizeof(int));
      printf("%d: %d i = %d parent = %d\n", getpid(), n, i, getppid());
      // exit(0);
    }
  }

  wait(0); wait(0); wait(0);
  close(a2b); close(b2a);
  return 0;
}
