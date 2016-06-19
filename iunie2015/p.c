#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define N 6
#define K 2

int main() {
  int i, n=1, p[N][2];
  for(i=0; i<N; i++) {
   pipe(p[i]);
 }

  write(p[0][1], &n, sizeof(int));
  for(i=0; i<N; i++) {
    if(fork() == 0) {
      read(p[i][0], &n, sizeof(int));
      n++;
      write(p[(i+K)%N][1], &n, sizeof(int));
      // printf("%d\n", getpid());
      exit(0);
    }
  }
  for(i=0; i<N; i++) {
    wait(0);
  }

  read(p[0][0], &n, sizeof(int));
  printf("%d\n", n);
  return 0;
}
