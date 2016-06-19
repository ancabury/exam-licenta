#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int p[2];
pid_t mypid;

int main (int argc, char *argv[]){
  pipe(p);
  if (fork() == 0){
      // in child
    close(p[0]); // close output
    if(argv[1][0] == 'c'){
      execlp(argv[2], argv[2], 0, NULL);
      printf("Exec finished\n");
    }
    mypid = getpid();
    printf("p=%d: pp=%d\n", mypid, getppid());
    write(p[1], &mypid, sizeof(int));
    // exit(0);
  }

  close(p[1]); //close input
  read(p[0], &mypid, sizeof(int));
  printf("Pid parinte %d: pid fiu %d\n", getpid(), mypid);
}
