#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{

  // if(argc != 3){
  if(argc < 2){
    printf(2, "usage: trace syscall_id\n");
    exit();
  }

  int i;
  int pid = getpid();      // get the id of the current process running on terminal

  int syscall_id = atoi(argv[1]);
  int traceresult = trace(pid, syscall_id);
  printf(2, "pid: %d   syscallid: %d   trace: %d\n", pid, syscall_id, traceresult);

  getpriority(pid); 
  getpriority(pid);
  getpriority(pid);

  for (i = 0; i < 10; i++) {
    pid = i;
    traceresult = trace(pid, syscall_id);
    printf(2, "pid: %d   syscallid: %d   trace: %d\n", pid, syscall_id, traceresult);
  }

  // traceresult = trace(pid, syscall_id);
  // printf(2, "pid: %d   syscallid: %d   trace: %d\n", pid, syscall_id, traceresult);

  exit();
}
