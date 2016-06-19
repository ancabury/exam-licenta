#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main() {
   int p[5][2], i, n;
   for(i=0; i<5; i++) {
    pipe(p[i]);
  }

   n = getpid();
   write(p[0][1], &n, sizeof(int));
   for(i=0; i<5; i++) {
     if(fork() == 0) {
       read(p[i][0], &n, sizeof(int));
       n += getpid();
       write(p[(i+1)%5][1], &n, sizeof(int)); //L11
       printf("C: %d %d\n", getpid(), n); //L10
      for(i=0; i<5; i++) {
        close(p[i][0]);
        close(p[i][1]);
      }
      exit(0);
    }
   }

   for(i=0; i<5; i++) {
    wait(0);
  }
   read(p[0][0], &n, sizeof(int));

   for(i=0; i<5; i++) {
    close(p[i][0]);
    close(p[i][1]);
  }

   printf("P: %d %d\n", getpid(), n);
   return 0;
}
