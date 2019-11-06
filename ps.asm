
_ps: formato do arquivo elf32-i386


Desmontagem da seção .text:

00000000 <main>:
void sort(proc ptable[MAX_PROC]) {
    bubbleSort(ptable, MAX_PROC - 1);
}

int
main(int argc, char *argv[]){  
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  proc ptable[MAX_PROC];
  proc *p;
  int err;
  
  err = getptable(10*sizeof(proc),&ptable);
  10:	8d 9d 80 fe ff ff    	lea    -0x180(%ebp),%ebx
main(int argc, char *argv[]){  
  16:	81 ec 84 01 00 00    	sub    $0x184,%esp
  err = getptable(10*sizeof(proc),&ptable);
  1c:	53                   	push   %ebx
  1d:	68 68 01 00 00       	push   $0x168
  22:	e8 eb 05 00 00       	call   612 <getptable>
  if(err !=0)
  27:	83 c4 10             	add    $0x10,%esp
  2a:	85 c0                	test   %eax,%eax
  2c:	0f 85 92 01 00 00    	jne    1c4 <main+0x1c4>
    bubbleSort(ptable, MAX_PROC - 1);
  32:	83 ec 08             	sub    $0x8,%esp
  
  sort(ptable);

  p = &ptable[0];
  printf(1, "NAME\tPID\tPRIORITY\tSTATE\t\tPPID\tUSAGE\n");
  while(p != &ptable[MAX_PROC-1] && p->state != UNUSED){
  35:	8d 75 c4             	lea    -0x3c(%ebp),%esi
    bubbleSort(ptable, MAX_PROC - 1);
  38:	6a 09                	push   $0x9
  3a:	53                   	push   %ebx
  3b:	e8 50 02 00 00       	call   290 <bubbleSort>
  printf(1, "NAME\tPID\tPRIORITY\tSTATE\t\tPPID\tUSAGE\n");
  40:	5a                   	pop    %edx
  41:	59                   	pop    %ecx
  42:	68 78 0a 00 00       	push   $0xa78
  47:	6a 01                	push   $0x1
  49:	e8 72 06 00 00       	call   6c0 <printf>
  4e:	83 c4 10             	add    $0x10,%esp
  51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while(p != &ptable[MAX_PROC-1] && p->state != UNUSED){
  58:	8b 03                	mov    (%ebx),%eax
  5a:	85 c0                	test   %eax,%eax
  5c:	0f 84 a9 00 00 00    	je     10b <main+0x10b>
    printf(1,"%s\t", p->name);
  62:	8d 43 14             	lea    0x14(%ebx),%eax
  65:	83 ec 04             	sub    $0x4,%esp
  68:	50                   	push   %eax
  69:	68 2d 0a 00 00       	push   $0xa2d
  6e:	6a 01                	push   $0x1
  70:	e8 4b 06 00 00       	call   6c0 <printf>
  	printf(1,"%d\t",p->pid);
  75:	83 c4 0c             	add    $0xc,%esp
  78:	ff 73 04             	pushl  0x4(%ebx)
  7b:	68 31 0a 00 00       	push   $0xa31
  80:	6a 01                	push   $0x1
  82:	e8 39 06 00 00       	call   6c0 <printf>
    printf(1,"%d\t",p->priority);
  87:	83 c4 0c             	add    $0xc,%esp
  8a:	ff 73 0c             	pushl  0xc(%ebx)
  8d:	68 31 0a 00 00       	push   $0xa31
  92:	6a 01                	push   $0x1
  94:	e8 27 06 00 00       	call   6c0 <printf>
  	switch(p->state){
  99:	83 c4 10             	add    $0x10,%esp
  9c:	83 3b 05             	cmpl   $0x5,(%ebx)
  9f:	77 2f                	ja     d0 <main+0xd0>
  a1:	8b 03                	mov    (%ebx),%eax
  a3:	ff 24 85 a0 0a 00 00 	jmp    *0xaa0(,%eax,4)
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  		break;
  	case RUNNABLE:
  		printf(1,"\t%s ", "RUNNABLE");
  		break;
  	case RUNNING:
  		printf(1,"\t%s ", "RUNNING");
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 5a 0a 00 00       	push   $0xa5a
  b8:	68 3c 0a 00 00       	push   $0xa3c
  bd:	6a 01                	push   $0x1
  bf:	e8 fc 05 00 00       	call   6c0 <printf>
  		break;
  c4:	83 c4 10             	add    $0x10,%esp
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  	case ZOMBIE:
  		printf(1,"\t%s ", "ZOMBIE");
  		break;
  	} 
    if (p->pid == 1) {
  d0:	83 7b 04 01          	cmpl   $0x1,0x4(%ebx)
  d4:	74 5a                	je     130 <main+0x130>
        printf(1,"\tNE");
    } else {
        printf(1,"\t%d",p->ppid);
  d6:	83 ec 04             	sub    $0x4,%esp
  d9:	ff 73 08             	pushl  0x8(%ebx)
  dc:	68 6d 0a 00 00       	push   $0xa6d
  e1:	6a 01                	push   $0x1
  e3:	e8 d8 05 00 00       	call   6c0 <printf>
  e8:	83 c4 10             	add    $0x10,%esp
    }
  	p++;
    printf(1,"\t%d\n",p->usage);
  eb:	83 ec 04             	sub    $0x4,%esp
  	p++;
  ee:	83 c3 24             	add    $0x24,%ebx
    printf(1,"\t%d\n",p->usage);
  f1:	ff 73 10             	pushl  0x10(%ebx)
  f4:	68 71 0a 00 00       	push   $0xa71
  f9:	6a 01                	push   $0x1
  fb:	e8 c0 05 00 00       	call   6c0 <printf>
  while(p != &ptable[MAX_PROC-1] && p->state != UNUSED){
 100:	83 c4 10             	add    $0x10,%esp
 103:	39 f3                	cmp    %esi,%ebx
 105:	0f 85 4d ff ff ff    	jne    58 <main+0x58>
  }
  	  
  exit();
 10b:	e8 42 04 00 00       	call   552 <exit>
  		printf(1,"\t%s ", "UNUSED");
 110:	83 ec 04             	sub    $0x4,%esp
 113:	68 35 0a 00 00       	push   $0xa35
 118:	68 3c 0a 00 00       	push   $0xa3c
 11d:	6a 01                	push   $0x1
 11f:	e8 9c 05 00 00       	call   6c0 <printf>
  		break;
 124:	83 c4 10             	add    $0x10,%esp
    if (p->pid == 1) {
 127:	83 7b 04 01          	cmpl   $0x1,0x4(%ebx)
 12b:	75 a9                	jne    d6 <main+0xd6>
 12d:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1,"\tNE");
 130:	83 ec 08             	sub    $0x8,%esp
 133:	68 69 0a 00 00       	push   $0xa69
 138:	6a 01                	push   $0x1
 13a:	e8 81 05 00 00       	call   6c0 <printf>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	eb a7                	jmp    eb <main+0xeb>
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  		printf(1,"\t%s ", "ZOMBIE");
 148:	83 ec 04             	sub    $0x4,%esp
 14b:	68 62 0a 00 00       	push   $0xa62
 150:	68 3c 0a 00 00       	push   $0xa3c
 155:	6a 01                	push   $0x1
 157:	e8 64 05 00 00       	call   6c0 <printf>
  		break;
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	e9 6c ff ff ff       	jmp    d0 <main+0xd0>
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  		printf(1,"\t%s ", "SLEEPING");
 168:	83 ec 04             	sub    $0x4,%esp
 16b:	68 48 0a 00 00       	push   $0xa48
 170:	68 3c 0a 00 00       	push   $0xa3c
 175:	6a 01                	push   $0x1
 177:	e8 44 05 00 00       	call   6c0 <printf>
  		break;
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	e9 4c ff ff ff       	jmp    d0 <main+0xd0>
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  		printf(1,"\t%s ", "EMBRYO");
 188:	83 ec 04             	sub    $0x4,%esp
 18b:	68 41 0a 00 00       	push   $0xa41
 190:	68 3c 0a 00 00       	push   $0xa3c
 195:	6a 01                	push   $0x1
 197:	e8 24 05 00 00       	call   6c0 <printf>
  		break;
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	e9 2c ff ff ff       	jmp    d0 <main+0xd0>
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  		printf(1,"\t%s ", "RUNNABLE");
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	68 51 0a 00 00       	push   $0xa51
 1b0:	68 3c 0a 00 00       	push   $0xa3c
 1b5:	6a 01                	push   $0x1
 1b7:	e8 04 05 00 00       	call   6c0 <printf>
  		break;
 1bc:	83 c4 10             	add    $0x10,%esp
 1bf:	e9 0c ff ff ff       	jmp    d0 <main+0xd0>
    printf(1,"Error getting ptable");
 1c4:	56                   	push   %esi
 1c5:	56                   	push   %esi
 1c6:	68 18 0a 00 00       	push   $0xa18
 1cb:	6a 01                	push   $0x1
 1cd:	e8 ee 04 00 00       	call   6c0 <printf>
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	e9 58 fe ff ff       	jmp    32 <main+0x32>
 1da:	66 90                	xchg   %ax,%ax
 1dc:	66 90                	xchg   %ax,%ax
 1de:	66 90                	xchg   %ax,%ax

000001e0 <swap>:
void swap (proc* p1, proc* p2) {
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
 1e6:	83 ec 48             	sub    $0x48,%esp
 1e9:	8b 55 08             	mov    0x8(%ebp),%edx
 1ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  proc temp = *p1;
 1ef:	8b 5a 0c             	mov    0xc(%edx),%ebx
 1f2:	8b 3a                	mov    (%edx),%edi
 1f4:	8b 4a 08             	mov    0x8(%edx),%ecx
 1f7:	8b 72 04             	mov    0x4(%edx),%esi
 1fa:	89 5d bc             	mov    %ebx,-0x44(%ebp)
 1fd:	8b 5a 14             	mov    0x14(%edx),%ebx
 200:	89 4d c0             	mov    %ecx,-0x40(%ebp)
 203:	8b 4a 10             	mov    0x10(%edx),%ecx
 206:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
  *p1 = *p2;
 209:	8b 18                	mov    (%eax),%ebx
  proc temp = *p1;
 20b:	89 4d b8             	mov    %ecx,-0x48(%ebp)
 20e:	8b 4a 18             	mov    0x18(%edx),%ecx
  *p1 = *p2;
 211:	89 1a                	mov    %ebx,(%edx)
 213:	8b 58 04             	mov    0x4(%eax),%ebx
  proc temp = *p1;
 216:	89 4d b0             	mov    %ecx,-0x50(%ebp)
 219:	8b 4a 1c             	mov    0x1c(%edx),%ecx
  *p1 = *p2;
 21c:	89 5a 04             	mov    %ebx,0x4(%edx)
 21f:	8b 58 08             	mov    0x8(%eax),%ebx
  proc temp = *p1;
 222:	89 4d ac             	mov    %ecx,-0x54(%ebp)
 225:	8b 4a 20             	mov    0x20(%edx),%ecx
  *p1 = *p2;
 228:	89 5a 08             	mov    %ebx,0x8(%edx)
 22b:	8b 58 0c             	mov    0xc(%eax),%ebx
 22e:	89 5a 0c             	mov    %ebx,0xc(%edx)
 231:	8b 58 10             	mov    0x10(%eax),%ebx
 234:	89 5a 10             	mov    %ebx,0x10(%edx)
 237:	8b 58 14             	mov    0x14(%eax),%ebx
 23a:	89 5a 14             	mov    %ebx,0x14(%edx)
 23d:	8b 58 18             	mov    0x18(%eax),%ebx
 240:	89 5a 18             	mov    %ebx,0x18(%edx)
 243:	8b 58 1c             	mov    0x1c(%eax),%ebx
 246:	89 5a 1c             	mov    %ebx,0x1c(%edx)
 249:	8b 58 20             	mov    0x20(%eax),%ebx
 24c:	89 5a 20             	mov    %ebx,0x20(%edx)
  *p2 = temp;
 24f:	89 38                	mov    %edi,(%eax)
 251:	89 70 04             	mov    %esi,0x4(%eax)
 254:	8b 7d bc             	mov    -0x44(%ebp),%edi
 257:	8b 75 c0             	mov    -0x40(%ebp),%esi
 25a:	89 48 20             	mov    %ecx,0x20(%eax)
 25d:	89 78 0c             	mov    %edi,0xc(%eax)
 260:	8b 7d b4             	mov    -0x4c(%ebp),%edi
 263:	89 70 08             	mov    %esi,0x8(%eax)
 266:	8b 75 b8             	mov    -0x48(%ebp),%esi
 269:	89 78 14             	mov    %edi,0x14(%eax)
 26c:	8b 7d ac             	mov    -0x54(%ebp),%edi
 26f:	89 70 10             	mov    %esi,0x10(%eax)
 272:	8b 75 b0             	mov    -0x50(%ebp),%esi
 275:	89 78 1c             	mov    %edi,0x1c(%eax)
 278:	89 70 18             	mov    %esi,0x18(%eax)
}
 27b:	83 c4 48             	add    $0x48,%esp
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5f                   	pop    %edi
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <bubbleSort>:
void bubbleSort(proc *v, int n){ 
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	8b 75 0c             	mov    0xc(%ebp),%esi
 298:	53                   	push   %ebx
    if (n < 1)return; 
 299:	85 f6                	test   %esi,%esi
 29b:	7e 31                	jle    2ce <bubbleSort+0x3e>
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
    for (int i=0; i<n; i++) 
 2a3:	31 ff                	xor    %edi,%edi
 2a5:	8d 76 00             	lea    0x0(%esi),%esi
        if (v[i].pid > v[i+1].pid && v[i+1].pid > 0) 
 2a8:	89 d8                	mov    %ebx,%eax
 2aa:	83 c3 24             	add    $0x24,%ebx
 2ad:	8b 50 28             	mov    0x28(%eax),%edx
 2b0:	39 50 04             	cmp    %edx,0x4(%eax)
 2b3:	7e 0d                	jle    2c2 <bubbleSort+0x32>
 2b5:	85 d2                	test   %edx,%edx
 2b7:	7e 09                	jle    2c2 <bubbleSort+0x32>
            swap(&v[i], &v[i+1]);  
 2b9:	53                   	push   %ebx
 2ba:	50                   	push   %eax
 2bb:	e8 20 ff ff ff       	call   1e0 <swap>
 2c0:	58                   	pop    %eax
 2c1:	5a                   	pop    %edx
    for (int i=0; i<n; i++) 
 2c2:	83 c7 01             	add    $0x1,%edi
 2c5:	39 f7                	cmp    %esi,%edi
 2c7:	7c df                	jl     2a8 <bubbleSort+0x18>
    if (n < 1)return; 
 2c9:	83 ee 01             	sub    $0x1,%esi
 2cc:	75 d2                	jne    2a0 <bubbleSort+0x10>
} 
 2ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d1:	5b                   	pop    %ebx
 2d2:	5e                   	pop    %esi
 2d3:	5f                   	pop    %edi
 2d4:	5d                   	pop    %ebp
 2d5:	c3                   	ret    
 2d6:	8d 76 00             	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <sort>:
void sort(proc ptable[MAX_PROC]) {
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
    bubbleSort(ptable, MAX_PROC - 1);
 2e3:	6a 09                	push   $0x9
 2e5:	ff 75 08             	pushl  0x8(%ebp)
 2e8:	e8 a3 ff ff ff       	call   290 <bubbleSort>
}
 2ed:	58                   	pop    %eax
 2ee:	5a                   	pop    %edx
 2ef:	c9                   	leave  
 2f0:	c3                   	ret    
 2f1:	66 90                	xchg   %ax,%ax
 2f3:	66 90                	xchg   %ax,%ax
 2f5:	66 90                	xchg   %ax,%ax
 2f7:	66 90                	xchg   %ax,%ax
 2f9:	66 90                	xchg   %ax,%ax
 2fb:	66 90                	xchg   %ax,%ax
 2fd:	66 90                	xchg   %ax,%ax
 2ff:	90                   	nop

00000300 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 30a:	89 c2                	mov    %eax,%edx
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 310:	83 c1 01             	add    $0x1,%ecx
 313:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 317:	83 c2 01             	add    $0x1,%edx
 31a:	84 db                	test   %bl,%bl
 31c:	88 5a ff             	mov    %bl,-0x1(%edx)
 31f:	75 ef                	jne    310 <strcpy+0x10>
    ;
  return os;
}
 321:	5b                   	pop    %ebx
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    
 324:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 32a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000330 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 55 08             	mov    0x8(%ebp),%edx
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 33a:	0f b6 02             	movzbl (%edx),%eax
 33d:	0f b6 19             	movzbl (%ecx),%ebx
 340:	84 c0                	test   %al,%al
 342:	75 1c                	jne    360 <strcmp+0x30>
 344:	eb 2a                	jmp    370 <strcmp+0x40>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 350:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 353:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 356:	83 c1 01             	add    $0x1,%ecx
 359:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 35c:	84 c0                	test   %al,%al
 35e:	74 10                	je     370 <strcmp+0x40>
 360:	38 d8                	cmp    %bl,%al
 362:	74 ec                	je     350 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 364:	29 d8                	sub    %ebx,%eax
}
 366:	5b                   	pop    %ebx
 367:	5d                   	pop    %ebp
 368:	c3                   	ret    
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 370:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 372:	29 d8                	sub    %ebx,%eax
}
 374:	5b                   	pop    %ebx
 375:	5d                   	pop    %ebp
 376:	c3                   	ret    
 377:	89 f6                	mov    %esi,%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <strlen>:

uint
strlen(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 386:	80 39 00             	cmpb   $0x0,(%ecx)
 389:	74 15                	je     3a0 <strlen+0x20>
 38b:	31 d2                	xor    %edx,%edx
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	83 c2 01             	add    $0x1,%edx
 393:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 397:	89 d0                	mov    %edx,%eax
 399:	75 f5                	jne    390 <strlen+0x10>
    ;
  return n;
}
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3a0:	31 c0                	xor    %eax,%eax
}
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bd:	89 d7                	mov    %edx,%edi
 3bf:	fc                   	cld    
 3c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <strchr>:

char*
strchr(const char *s, char c)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3da:	0f b6 10             	movzbl (%eax),%edx
 3dd:	84 d2                	test   %dl,%dl
 3df:	74 1d                	je     3fe <strchr+0x2e>
    if(*s == c)
 3e1:	38 d3                	cmp    %dl,%bl
 3e3:	89 d9                	mov    %ebx,%ecx
 3e5:	75 0d                	jne    3f4 <strchr+0x24>
 3e7:	eb 17                	jmp    400 <strchr+0x30>
 3e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f0:	38 ca                	cmp    %cl,%dl
 3f2:	74 0c                	je     400 <strchr+0x30>
  for(; *s; s++)
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	0f b6 10             	movzbl (%eax),%edx
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f2                	jne    3f0 <strchr+0x20>
      return (char*)s;
  return 0;
 3fe:	31 c0                	xor    %eax,%eax
}
 400:	5b                   	pop    %ebx
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    
 403:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <gets>:

char*
gets(char *buf, int max)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 416:	31 f6                	xor    %esi,%esi
 418:	89 f3                	mov    %esi,%ebx
{
 41a:	83 ec 1c             	sub    $0x1c,%esp
 41d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 420:	eb 2f                	jmp    451 <gets+0x41>
 422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 428:	8d 45 e7             	lea    -0x19(%ebp),%eax
 42b:	83 ec 04             	sub    $0x4,%esp
 42e:	6a 01                	push   $0x1
 430:	50                   	push   %eax
 431:	6a 00                	push   $0x0
 433:	e8 32 01 00 00       	call   56a <read>
    if(cc < 1)
 438:	83 c4 10             	add    $0x10,%esp
 43b:	85 c0                	test   %eax,%eax
 43d:	7e 1c                	jle    45b <gets+0x4b>
      break;
    buf[i++] = c;
 43f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 443:	83 c7 01             	add    $0x1,%edi
 446:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 449:	3c 0a                	cmp    $0xa,%al
 44b:	74 23                	je     470 <gets+0x60>
 44d:	3c 0d                	cmp    $0xd,%al
 44f:	74 1f                	je     470 <gets+0x60>
  for(i=0; i+1 < max; ){
 451:	83 c3 01             	add    $0x1,%ebx
 454:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 457:	89 fe                	mov    %edi,%esi
 459:	7c cd                	jl     428 <gets+0x18>
 45b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 460:	c6 03 00             	movb   $0x0,(%ebx)
}
 463:	8d 65 f4             	lea    -0xc(%ebp),%esp
 466:	5b                   	pop    %ebx
 467:	5e                   	pop    %esi
 468:	5f                   	pop    %edi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    
 46b:	90                   	nop
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	8b 75 08             	mov    0x8(%ebp),%esi
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	01 de                	add    %ebx,%esi
 478:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 47a:	c6 03 00             	movb   $0x0,(%ebx)
}
 47d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 480:	5b                   	pop    %ebx
 481:	5e                   	pop    %esi
 482:	5f                   	pop    %edi
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    
 485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <stat>:

int
stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	pushl  0x8(%ebp)
 49d:	e8 f0 00 00 00       	call   592 <open>
  if(fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 27                	js     4d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4a9:	83 ec 08             	sub    $0x8,%esp
 4ac:	ff 75 0c             	pushl  0xc(%ebp)
 4af:	89 c3                	mov    %eax,%ebx
 4b1:	50                   	push   %eax
 4b2:	e8 f3 00 00 00       	call   5aa <fstat>
  close(fd);
 4b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ba:	89 c6                	mov    %eax,%esi
  close(fd);
 4bc:	e8 b9 00 00 00       	call   57a <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d5:	eb ed                	jmp    4c4 <stat+0x34>
 4d7:	89 f6                	mov    %esi,%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <atoi>:

int
atoi(const char *s)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	53                   	push   %ebx
 4e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e7:	0f be 11             	movsbl (%ecx),%edx
 4ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 4ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 4ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 4f4:	77 1f                	ja     515 <atoi+0x35>
 4f6:	8d 76 00             	lea    0x0(%esi),%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 500:	8d 04 80             	lea    (%eax,%eax,4),%eax
 503:	83 c1 01             	add    $0x1,%ecx
 506:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 50a:	0f be 11             	movsbl (%ecx),%edx
 50d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 510:	80 fb 09             	cmp    $0x9,%bl
 513:	76 eb                	jbe    500 <atoi+0x20>
  return n;
}
 515:	5b                   	pop    %ebx
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000520 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	56                   	push   %esi
 524:	53                   	push   %ebx
 525:	8b 5d 10             	mov    0x10(%ebp),%ebx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 52e:	85 db                	test   %ebx,%ebx
 530:	7e 14                	jle    546 <memmove+0x26>
 532:	31 d2                	xor    %edx,%edx
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 538:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 53c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 53f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 542:	39 d3                	cmp    %edx,%ebx
 544:	75 f2                	jne    538 <memmove+0x18>
  return vdst;
}
 546:	5b                   	pop    %ebx
 547:	5e                   	pop    %esi
 548:	5d                   	pop    %ebp
 549:	c3                   	ret    

0000054a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54a:	b8 01 00 00 00       	mov    $0x1,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <exit>:
SYSCALL(exit)
 552:	b8 02 00 00 00       	mov    $0x2,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <wait>:
SYSCALL(wait)
 55a:	b8 03 00 00 00       	mov    $0x3,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <pipe>:
SYSCALL(pipe)
 562:	b8 04 00 00 00       	mov    $0x4,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <read>:
SYSCALL(read)
 56a:	b8 05 00 00 00       	mov    $0x5,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <write>:
SYSCALL(write)
 572:	b8 10 00 00 00       	mov    $0x10,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <close>:
SYSCALL(close)
 57a:	b8 15 00 00 00       	mov    $0x15,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <kill>:
SYSCALL(kill)
 582:	b8 06 00 00 00       	mov    $0x6,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <exec>:
SYSCALL(exec)
 58a:	b8 07 00 00 00       	mov    $0x7,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <open>:
SYSCALL(open)
 592:	b8 0f 00 00 00       	mov    $0xf,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <mknod>:
SYSCALL(mknod)
 59a:	b8 11 00 00 00       	mov    $0x11,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <unlink>:
SYSCALL(unlink)
 5a2:	b8 12 00 00 00       	mov    $0x12,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <fstat>:
SYSCALL(fstat)
 5aa:	b8 08 00 00 00       	mov    $0x8,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <link>:
SYSCALL(link)
 5b2:	b8 13 00 00 00       	mov    $0x13,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <mkdir>:
SYSCALL(mkdir)
 5ba:	b8 14 00 00 00       	mov    $0x14,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <chdir>:
SYSCALL(chdir)
 5c2:	b8 09 00 00 00       	mov    $0x9,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <dup>:
SYSCALL(dup)
 5ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <getpid>:
SYSCALL(getpid)
 5d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <sbrk>:
SYSCALL(sbrk)
 5da:	b8 0c 00 00 00       	mov    $0xc,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <sleep>:
SYSCALL(sleep)
 5e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <uptime>:
SYSCALL(uptime)
 5ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <getpriority>:
SYSCALL(getpriority)
 5f2:	b8 16 00 00 00       	mov    $0x16,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <setpriority>:
SYSCALL(setpriority)
 5fa:	b8 17 00 00 00       	mov    $0x17,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <getusage>:
SYSCALL(getusage)
 602:	b8 18 00 00 00       	mov    $0x18,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <trace>:
SYSCALL(trace)
 60a:	b8 19 00 00 00       	mov    $0x19,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <getptable>:
SYSCALL(getptable)
 612:	b8 1a 00 00 00       	mov    $0x1a,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    
 61a:	66 90                	xchg   %ax,%ax
 61c:	66 90                	xchg   %ax,%ax
 61e:	66 90                	xchg   %ax,%ax

00000620 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 629:	85 d2                	test   %edx,%edx
{
 62b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 62e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 630:	79 76                	jns    6a8 <printint+0x88>
 632:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 636:	74 70                	je     6a8 <printint+0x88>
    x = -xx;
 638:	f7 d8                	neg    %eax
    neg = 1;
 63a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 641:	31 f6                	xor    %esi,%esi
 643:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 646:	eb 0a                	jmp    652 <printint+0x32>
 648:	90                   	nop
 649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 650:	89 fe                	mov    %edi,%esi
 652:	31 d2                	xor    %edx,%edx
 654:	8d 7e 01             	lea    0x1(%esi),%edi
 657:	f7 f1                	div    %ecx
 659:	0f b6 92 c0 0a 00 00 	movzbl 0xac0(%edx),%edx
  }while((x /= base) != 0);
 660:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 662:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 665:	75 e9                	jne    650 <printint+0x30>
  if(neg)
 667:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 66a:	85 c0                	test   %eax,%eax
 66c:	74 08                	je     676 <printint+0x56>
    buf[i++] = '-';
 66e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 673:	8d 7e 02             	lea    0x2(%esi),%edi
 676:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 67a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 683:	83 ec 04             	sub    $0x4,%esp
 686:	83 ee 01             	sub    $0x1,%esi
 689:	6a 01                	push   $0x1
 68b:	53                   	push   %ebx
 68c:	57                   	push   %edi
 68d:	88 45 d7             	mov    %al,-0x29(%ebp)
 690:	e8 dd fe ff ff       	call   572 <write>

  while(--i >= 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	39 de                	cmp    %ebx,%esi
 69a:	75 e4                	jne    680 <printint+0x60>
    putc(fd, buf[i]);
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6af:	eb 90                	jmp    641 <printint+0x21>
 6b1:	eb 0d                	jmp    6c0 <printf>
 6b3:	90                   	nop
 6b4:	90                   	nop
 6b5:	90                   	nop
 6b6:	90                   	nop
 6b7:	90                   	nop
 6b8:	90                   	nop
 6b9:	90                   	nop
 6ba:	90                   	nop
 6bb:	90                   	nop
 6bc:	90                   	nop
 6bd:	90                   	nop
 6be:	90                   	nop
 6bf:	90                   	nop

000006c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6cc:	0f b6 1e             	movzbl (%esi),%ebx
 6cf:	84 db                	test   %bl,%bl
 6d1:	0f 84 b3 00 00 00    	je     78a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 6d7:	8d 45 10             	lea    0x10(%ebp),%eax
 6da:	83 c6 01             	add    $0x1,%esi
  state = 0;
 6dd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 6df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6e2:	eb 2f                	jmp    713 <printf+0x53>
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	0f 84 a7 00 00 00    	je     798 <printf+0xd8>
  write(fd, &c, 1);
 6f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6f4:	83 ec 04             	sub    $0x4,%esp
 6f7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6fa:	6a 01                	push   $0x1
 6fc:	50                   	push   %eax
 6fd:	ff 75 08             	pushl  0x8(%ebp)
 700:	e8 6d fe ff ff       	call   572 <write>
 705:	83 c4 10             	add    $0x10,%esp
 708:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 70b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 70f:	84 db                	test   %bl,%bl
 711:	74 77                	je     78a <printf+0xca>
    if(state == 0){
 713:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 715:	0f be cb             	movsbl %bl,%ecx
 718:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 71b:	74 cb                	je     6e8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 71d:	83 ff 25             	cmp    $0x25,%edi
 720:	75 e6                	jne    708 <printf+0x48>
      if(c == 'd'){
 722:	83 f8 64             	cmp    $0x64,%eax
 725:	0f 84 05 01 00 00    	je     830 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 72b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 731:	83 f9 70             	cmp    $0x70,%ecx
 734:	74 72                	je     7a8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 736:	83 f8 73             	cmp    $0x73,%eax
 739:	0f 84 99 00 00 00    	je     7d8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 73f:	83 f8 63             	cmp    $0x63,%eax
 742:	0f 84 08 01 00 00    	je     850 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	0f 84 ef 00 00 00    	je     840 <printf+0x180>
  write(fd, &c, 1);
 751:	8d 45 e7             	lea    -0x19(%ebp),%eax
 754:	83 ec 04             	sub    $0x4,%esp
 757:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 75b:	6a 01                	push   $0x1
 75d:	50                   	push   %eax
 75e:	ff 75 08             	pushl  0x8(%ebp)
 761:	e8 0c fe ff ff       	call   572 <write>
 766:	83 c4 0c             	add    $0xc,%esp
 769:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 76c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 76f:	6a 01                	push   $0x1
 771:	50                   	push   %eax
 772:	ff 75 08             	pushl  0x8(%ebp)
 775:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 778:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 77a:	e8 f3 fd ff ff       	call   572 <write>
  for(i = 0; fmt[i]; i++){
 77f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 783:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 786:	84 db                	test   %bl,%bl
 788:	75 89                	jne    713 <printf+0x53>
    }
  }
}
 78a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78d:	5b                   	pop    %ebx
 78e:	5e                   	pop    %esi
 78f:	5f                   	pop    %edi
 790:	5d                   	pop    %ebp
 791:	c3                   	ret    
 792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 798:	bf 25 00 00 00       	mov    $0x25,%edi
 79d:	e9 66 ff ff ff       	jmp    708 <printf+0x48>
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7a8:	83 ec 0c             	sub    $0xc,%esp
 7ab:	b9 10 00 00 00       	mov    $0x10,%ecx
 7b0:	6a 00                	push   $0x0
 7b2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	8b 17                	mov    (%edi),%edx
 7ba:	e8 61 fe ff ff       	call   620 <printint>
        ap++;
 7bf:	89 f8                	mov    %edi,%eax
 7c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c4:	31 ff                	xor    %edi,%edi
        ap++;
 7c6:	83 c0 04             	add    $0x4,%eax
 7c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 7cc:	e9 37 ff ff ff       	jmp    708 <printf+0x48>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7db:	8b 08                	mov    (%eax),%ecx
        ap++;
 7dd:	83 c0 04             	add    $0x4,%eax
 7e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 7e3:	85 c9                	test   %ecx,%ecx
 7e5:	0f 84 8e 00 00 00    	je     879 <printf+0x1b9>
        while(*s != 0){
 7eb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 7ee:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 7f0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 7f2:	84 c0                	test   %al,%al
 7f4:	0f 84 0e ff ff ff    	je     708 <printf+0x48>
 7fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7fd:	89 de                	mov    %ebx,%esi
 7ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 802:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 805:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 808:	83 ec 04             	sub    $0x4,%esp
          s++;
 80b:	83 c6 01             	add    $0x1,%esi
 80e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 811:	6a 01                	push   $0x1
 813:	57                   	push   %edi
 814:	53                   	push   %ebx
 815:	e8 58 fd ff ff       	call   572 <write>
        while(*s != 0){
 81a:	0f b6 06             	movzbl (%esi),%eax
 81d:	83 c4 10             	add    $0x10,%esp
 820:	84 c0                	test   %al,%al
 822:	75 e4                	jne    808 <printf+0x148>
 824:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 827:	31 ff                	xor    %edi,%edi
 829:	e9 da fe ff ff       	jmp    708 <printf+0x48>
 82e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 830:	83 ec 0c             	sub    $0xc,%esp
 833:	b9 0a 00 00 00       	mov    $0xa,%ecx
 838:	6a 01                	push   $0x1
 83a:	e9 73 ff ff ff       	jmp    7b2 <printf+0xf2>
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 846:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 849:	6a 01                	push   $0x1
 84b:	e9 21 ff ff ff       	jmp    771 <printf+0xb1>
        putc(fd, *ap);
 850:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 853:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 856:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 858:	6a 01                	push   $0x1
        ap++;
 85a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 85d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 860:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 863:	50                   	push   %eax
 864:	ff 75 08             	pushl  0x8(%ebp)
 867:	e8 06 fd ff ff       	call   572 <write>
        ap++;
 86c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 86f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 872:	31 ff                	xor    %edi,%edi
 874:	e9 8f fe ff ff       	jmp    708 <printf+0x48>
          s = "(null)";
 879:	bb b8 0a 00 00       	mov    $0xab8,%ebx
        while(*s != 0){
 87e:	b8 28 00 00 00       	mov    $0x28,%eax
 883:	e9 72 ff ff ff       	jmp    7fa <printf+0x13a>
 888:	66 90                	xchg   %ax,%ax
 88a:	66 90                	xchg   %ax,%ax
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 e4 0d 00 00       	mov    0xde4,%eax
{
 896:	89 e5                	mov    %esp,%ebp
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	53                   	push   %ebx
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 89e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a8:	39 c8                	cmp    %ecx,%eax
 8aa:	8b 10                	mov    (%eax),%edx
 8ac:	73 32                	jae    8e0 <free+0x50>
 8ae:	39 d1                	cmp    %edx,%ecx
 8b0:	72 04                	jb     8b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b2:	39 d0                	cmp    %edx,%eax
 8b4:	72 32                	jb     8e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8bc:	39 fa                	cmp    %edi,%edx
 8be:	74 30                	je     8f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c3:	8b 50 04             	mov    0x4(%eax),%edx
 8c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c9:	39 f1                	cmp    %esi,%ecx
 8cb:	74 3a                	je     907 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8cf:	a3 e4 0d 00 00       	mov    %eax,0xde4
}
 8d4:	5b                   	pop    %ebx
 8d5:	5e                   	pop    %esi
 8d6:	5f                   	pop    %edi
 8d7:	5d                   	pop    %ebp
 8d8:	c3                   	ret    
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e0:	39 d0                	cmp    %edx,%eax
 8e2:	72 04                	jb     8e8 <free+0x58>
 8e4:	39 d1                	cmp    %edx,%ecx
 8e6:	72 ce                	jb     8b6 <free+0x26>
{
 8e8:	89 d0                	mov    %edx,%eax
 8ea:	eb bc                	jmp    8a8 <free+0x18>
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8f0:	03 72 04             	add    0x4(%edx),%esi
 8f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 12                	mov    (%edx),%edx
 8fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8fd:	8b 50 04             	mov    0x4(%eax),%edx
 900:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 903:	39 f1                	cmp    %esi,%ecx
 905:	75 c6                	jne    8cd <free+0x3d>
    p->s.size += bp->s.size;
 907:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 90a:	a3 e4 0d 00 00       	mov    %eax,0xde4
    p->s.size += bp->s.size;
 90f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 912:	8b 53 f8             	mov    -0x8(%ebx),%edx
 915:	89 10                	mov    %edx,(%eax)
}
 917:	5b                   	pop    %ebx
 918:	5e                   	pop    %esi
 919:	5f                   	pop    %edi
 91a:	5d                   	pop    %ebp
 91b:	c3                   	ret    
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 92c:	8b 15 e4 0d 00 00    	mov    0xde4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 932:	8d 78 07             	lea    0x7(%eax),%edi
 935:	c1 ef 03             	shr    $0x3,%edi
 938:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 93b:	85 d2                	test   %edx,%edx
 93d:	0f 84 9d 00 00 00    	je     9e0 <malloc+0xc0>
 943:	8b 02                	mov    (%edx),%eax
 945:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 948:	39 cf                	cmp    %ecx,%edi
 94a:	76 6c                	jbe    9b8 <malloc+0x98>
 94c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 952:	bb 00 10 00 00       	mov    $0x1000,%ebx
 957:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 95a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 961:	eb 0e                	jmp    971 <malloc+0x51>
 963:	90                   	nop
 964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 96a:	8b 48 04             	mov    0x4(%eax),%ecx
 96d:	39 f9                	cmp    %edi,%ecx
 96f:	73 47                	jae    9b8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 971:	39 05 e4 0d 00 00    	cmp    %eax,0xde4
 977:	89 c2                	mov    %eax,%edx
 979:	75 ed                	jne    968 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 97b:	83 ec 0c             	sub    $0xc,%esp
 97e:	56                   	push   %esi
 97f:	e8 56 fc ff ff       	call   5da <sbrk>
  if(p == (char*)-1)
 984:	83 c4 10             	add    $0x10,%esp
 987:	83 f8 ff             	cmp    $0xffffffff,%eax
 98a:	74 1c                	je     9a8 <malloc+0x88>
  hp->s.size = nu;
 98c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 98f:	83 ec 0c             	sub    $0xc,%esp
 992:	83 c0 08             	add    $0x8,%eax
 995:	50                   	push   %eax
 996:	e8 f5 fe ff ff       	call   890 <free>
  return freep;
 99b:	8b 15 e4 0d 00 00    	mov    0xde4,%edx
      if((p = morecore(nunits)) == 0)
 9a1:	83 c4 10             	add    $0x10,%esp
 9a4:	85 d2                	test   %edx,%edx
 9a6:	75 c0                	jne    968 <malloc+0x48>
        return 0;
  }
}
 9a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9ab:	31 c0                	xor    %eax,%eax
}
 9ad:	5b                   	pop    %ebx
 9ae:	5e                   	pop    %esi
 9af:	5f                   	pop    %edi
 9b0:	5d                   	pop    %ebp
 9b1:	c3                   	ret    
 9b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9b8:	39 cf                	cmp    %ecx,%edi
 9ba:	74 54                	je     a10 <malloc+0xf0>
        p->s.size -= nunits;
 9bc:	29 f9                	sub    %edi,%ecx
 9be:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9c4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9c7:	89 15 e4 0d 00 00    	mov    %edx,0xde4
}
 9cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9d0:	83 c0 08             	add    $0x8,%eax
}
 9d3:	5b                   	pop    %ebx
 9d4:	5e                   	pop    %esi
 9d5:	5f                   	pop    %edi
 9d6:	5d                   	pop    %ebp
 9d7:	c3                   	ret    
 9d8:	90                   	nop
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 9e0:	c7 05 e4 0d 00 00 e8 	movl   $0xde8,0xde4
 9e7:	0d 00 00 
 9ea:	c7 05 e8 0d 00 00 e8 	movl   $0xde8,0xde8
 9f1:	0d 00 00 
    base.s.size = 0;
 9f4:	b8 e8 0d 00 00       	mov    $0xde8,%eax
 9f9:	c7 05 ec 0d 00 00 00 	movl   $0x0,0xdec
 a00:	00 00 00 
 a03:	e9 44 ff ff ff       	jmp    94c <malloc+0x2c>
 a08:	90                   	nop
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a10:	8b 08                	mov    (%eax),%ecx
 a12:	89 0a                	mov    %ecx,(%edx)
 a14:	eb b1                	jmp    9c7 <malloc+0xa7>
