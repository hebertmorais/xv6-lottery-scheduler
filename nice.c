#include "types.h"
#include "user.h"
#include "param.h"

int
main(int argc, char **argv) {
  if (argc < 2 || argc > 3) {
    printf(2, "usage: nice pid [new_priority]\n");
    exit();
  }

  // // validar se o pid existe
  int pid = atoi(argv[1]);
  // if (pid >= NPROC || pid < 0) {
  //   printf(2, "invalid pid my darling\n");
  //   exit();
  // }
  // query priority
  if (argc == 3) {
    int newpriority = atoi(argv[2]);
    if (newpriority > 31 || newpriority < 0) {
      printf(2, "priority should be in range 0 up to 31\n");
      exit();
    }
    int oldpriority = setpriority(pid, newpriority);
    if (oldpriority < 0) {
      printf(2, "could not set new priority\n");
      exit();
    }

    printf(2, "change process priority from %d to %d\n", oldpriority, newpriority);
  } else {
    int currentpriority = getpriority(pid);
    if (currentpriority < 0) {
      printf(2, "could not get priority\n");
      exit();
    }
    printf(2, "pid %d has priority %d\n", pid, currentpriority);
  }
  exit();

}
