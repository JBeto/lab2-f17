
_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
   if(n<500) 
   test(n+1);
   return n;
}
int main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
   int pid=0;
   pid=fork();
    1009:	e8 ac 02 00 00       	call   12ba <fork>
   if(pid==0){
    100e:	85 c0                	test   %eax,%eax
    1010:	75 25                	jne    1037 <main+0x37>

int test(int n)
{
   //if(n<100) 
   if(n<500) 
   test(n+1);
    1012:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    1019:	e8 52 00 00 00       	call   1070 <test>
   pid=fork();
   if(pid==0){
   //int x=1;
   //printf(1, "address %x\n", &x);
   test(1);
   printf(1, "Finished child\n");
    101e:	c7 44 24 04 c1 17 00 	movl   $0x17c1,0x4(%esp)
    1025:	00 
    1026:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    102d:	e8 ee 03 00 00       	call   1420 <printf>
   //exec("null",0);
   exit();
    1032:	e8 8b 02 00 00       	call   12c2 <exit>
   }
   wait();
    1037:	e8 8e 02 00 00       	call   12ca <wait>

int test(int n)
{
   //if(n<100) 
   if(n<500) 
   test(n+1);
    103c:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    1043:	e8 28 00 00 00       	call   1070 <test>
   //exec("null",0);
   exit();
   }
   wait();
   test(1);
   printf(1, "Finished parent\n");
    1048:	c7 44 24 04 d1 17 00 	movl   $0x17d1,0x4(%esp)
    104f:	00 
    1050:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1057:	e8 c4 03 00 00       	call   1420 <printf>
   exit();
    105c:	e8 61 02 00 00       	call   12c2 <exit>
    1061:	66 90                	xchg   %ax,%ax
    1063:	66 90                	xchg   %ax,%ax
    1065:	66 90                	xchg   %ax,%ax
    1067:	66 90                	xchg   %ax,%ax
    1069:	66 90                	xchg   %ax,%ax
    106b:	66 90                	xchg   %ax,%ax
    106d:	66 90                	xchg   %ax,%ax
    106f:	90                   	nop

00001070 <test>:
#include "types.h"
#include "stat.h"
#include "user.h"

int test(int n)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	53                   	push   %ebx
    1074:	83 ec 14             	sub    $0x14,%esp
    1077:	8b 5d 08             	mov    0x8(%ebp),%ebx
   //if(n<100) 
   if(n<500) 
    107a:	81 fb f3 01 00 00    	cmp    $0x1f3,%ebx
    1080:	7f 0b                	jg     108d <test+0x1d>
   test(n+1);
    1082:	8d 43 01             	lea    0x1(%ebx),%eax
    1085:	89 04 24             	mov    %eax,(%esp)
    1088:	e8 e3 ff ff ff       	call   1070 <test>
   return n;
}
    108d:	83 c4 14             	add    $0x14,%esp
    1090:	89 d8                	mov    %ebx,%eax
    1092:	5b                   	pop    %ebx
    1093:	5d                   	pop    %ebp
    1094:	c3                   	ret    
    1095:	66 90                	xchg   %ax,%ax
    1097:	66 90                	xchg   %ax,%ax
    1099:	66 90                	xchg   %ax,%ax
    109b:	66 90                	xchg   %ax,%ax
    109d:	66 90                	xchg   %ax,%ax
    109f:	90                   	nop

000010a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	8b 45 08             	mov    0x8(%ebp),%eax
    10a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    10a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10aa:	89 c2                	mov    %eax,%edx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10b0:	83 c1 01             	add    $0x1,%ecx
    10b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10b7:	83 c2 01             	add    $0x1,%edx
    10ba:	84 db                	test   %bl,%bl
    10bc:	88 5a ff             	mov    %bl,-0x1(%edx)
    10bf:	75 ef                	jne    10b0 <strcpy+0x10>
    ;
  return os;
}
    10c1:	5b                   	pop    %ebx
    10c2:	5d                   	pop    %ebp
    10c3:	c3                   	ret    
    10c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 55 08             	mov    0x8(%ebp),%edx
    10d6:	53                   	push   %ebx
    10d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10da:	0f b6 02             	movzbl (%edx),%eax
    10dd:	84 c0                	test   %al,%al
    10df:	74 2d                	je     110e <strcmp+0x3e>
    10e1:	0f b6 19             	movzbl (%ecx),%ebx
    10e4:	38 d8                	cmp    %bl,%al
    10e6:	74 0e                	je     10f6 <strcmp+0x26>
    10e8:	eb 2b                	jmp    1115 <strcmp+0x45>
    10ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10f0:	38 c8                	cmp    %cl,%al
    10f2:	75 15                	jne    1109 <strcmp+0x39>
    p++, q++;
    10f4:	89 d9                	mov    %ebx,%ecx
    10f6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10fc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1103:	84 c0                	test   %al,%al
    1105:	75 e9                	jne    10f0 <strcmp+0x20>
    1107:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1109:	29 c8                	sub    %ecx,%eax
}
    110b:	5b                   	pop    %ebx
    110c:	5d                   	pop    %ebp
    110d:	c3                   	ret    
    110e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1111:	31 c0                	xor    %eax,%eax
    1113:	eb f4                	jmp    1109 <strcmp+0x39>
    1115:	0f b6 cb             	movzbl %bl,%ecx
    1118:	eb ef                	jmp    1109 <strcmp+0x39>
    111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001120 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1126:	80 39 00             	cmpb   $0x0,(%ecx)
    1129:	74 12                	je     113d <strlen+0x1d>
    112b:	31 d2                	xor    %edx,%edx
    112d:	8d 76 00             	lea    0x0(%esi),%esi
    1130:	83 c2 01             	add    $0x1,%edx
    1133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1137:	89 d0                	mov    %edx,%eax
    1139:	75 f5                	jne    1130 <strlen+0x10>
    ;
  return n;
}
    113b:	5d                   	pop    %ebp
    113c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    113d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    113f:	5d                   	pop    %ebp
    1140:	c3                   	ret    
    1141:	eb 0d                	jmp    1150 <memset>
    1143:	90                   	nop
    1144:	90                   	nop
    1145:	90                   	nop
    1146:	90                   	nop
    1147:	90                   	nop
    1148:	90                   	nop
    1149:	90                   	nop
    114a:	90                   	nop
    114b:	90                   	nop
    114c:	90                   	nop
    114d:	90                   	nop
    114e:	90                   	nop
    114f:	90                   	nop

00001150 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	8b 55 08             	mov    0x8(%ebp),%edx
    1156:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    115a:	8b 45 0c             	mov    0xc(%ebp),%eax
    115d:	89 d7                	mov    %edx,%edi
    115f:	fc                   	cld    
    1160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1162:	89 d0                	mov    %edx,%eax
    1164:	5f                   	pop    %edi
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	89 f6                	mov    %esi,%esi
    1169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001170 <strchr>:

char*
strchr(const char *s, char c)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
    1176:	53                   	push   %ebx
    1177:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    117a:	0f b6 18             	movzbl (%eax),%ebx
    117d:	84 db                	test   %bl,%bl
    117f:	74 1d                	je     119e <strchr+0x2e>
    if(*s == c)
    1181:	38 d3                	cmp    %dl,%bl
    1183:	89 d1                	mov    %edx,%ecx
    1185:	75 0d                	jne    1194 <strchr+0x24>
    1187:	eb 17                	jmp    11a0 <strchr+0x30>
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1190:	38 ca                	cmp    %cl,%dl
    1192:	74 0c                	je     11a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1194:	83 c0 01             	add    $0x1,%eax
    1197:	0f b6 10             	movzbl (%eax),%edx
    119a:	84 d2                	test   %dl,%dl
    119c:	75 f2                	jne    1190 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    119e:	31 c0                	xor    %eax,%eax
}
    11a0:	5b                   	pop    %ebx
    11a1:	5d                   	pop    %ebp
    11a2:	c3                   	ret    
    11a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011b0 <gets>:

char*
gets(char *buf, int max)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11b5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
    11b7:	53                   	push   %ebx
    11b8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    11bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11be:	eb 31                	jmp    11f1 <gets+0x41>
    cc = read(0, &c, 1);
    11c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11c7:	00 
    11c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
    11cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11d3:	e8 02 01 00 00       	call   12da <read>
    if(cc < 1)
    11d8:	85 c0                	test   %eax,%eax
    11da:	7e 1d                	jle    11f9 <gets+0x49>
      break;
    buf[i++] = c;
    11dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    11e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    11e5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    11e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11eb:	74 0c                	je     11f9 <gets+0x49>
    11ed:	3c 0a                	cmp    $0xa,%al
    11ef:	74 08                	je     11f9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11f1:	8d 5e 01             	lea    0x1(%esi),%ebx
    11f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11f7:	7c c7                	jl     11c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f9:	8b 45 08             	mov    0x8(%ebp),%eax
    11fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1200:	83 c4 2c             	add    $0x2c,%esp
    1203:	5b                   	pop    %ebx
    1204:	5e                   	pop    %esi
    1205:	5f                   	pop    %edi
    1206:	5d                   	pop    %ebp
    1207:	c3                   	ret    
    1208:	90                   	nop
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001210 <stat>:

int
stat(char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
    1215:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1218:	8b 45 08             	mov    0x8(%ebp),%eax
    121b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1222:	00 
    1223:	89 04 24             	mov    %eax,(%esp)
    1226:	e8 d7 00 00 00       	call   1302 <open>
  if(fd < 0)
    122b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    122d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    122f:	78 27                	js     1258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1231:	8b 45 0c             	mov    0xc(%ebp),%eax
    1234:	89 1c 24             	mov    %ebx,(%esp)
    1237:	89 44 24 04          	mov    %eax,0x4(%esp)
    123b:	e8 da 00 00 00       	call   131a <fstat>
  close(fd);
    1240:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    1243:	89 c6                	mov    %eax,%esi
  close(fd);
    1245:	e8 a0 00 00 00       	call   12ea <close>
  return r;
    124a:	89 f0                	mov    %esi,%eax
}
    124c:	83 c4 10             	add    $0x10,%esp
    124f:	5b                   	pop    %ebx
    1250:	5e                   	pop    %esi
    1251:	5d                   	pop    %ebp
    1252:	c3                   	ret    
    1253:	90                   	nop
    1254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    125d:	eb ed                	jmp    124c <stat+0x3c>
    125f:	90                   	nop

00001260 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1266:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 11             	movsbl (%ecx),%edx
    126a:	8d 42 d0             	lea    -0x30(%edx),%eax
    126d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
    126f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1274:	77 17                	ja     128d <atoi+0x2d>
    1276:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1278:	83 c1 01             	add    $0x1,%ecx
    127b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    127e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1282:	0f be 11             	movsbl (%ecx),%edx
    1285:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1288:	80 fb 09             	cmp    $0x9,%bl
    128b:	76 eb                	jbe    1278 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
    128d:	5b                   	pop    %ebx
    128e:	5d                   	pop    %ebp
    128f:	c3                   	ret    

00001290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1290:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1291:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1293:	89 e5                	mov    %esp,%ebp
    1295:	56                   	push   %esi
    1296:	8b 45 08             	mov    0x8(%ebp),%eax
    1299:	53                   	push   %ebx
    129a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    129d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12a0:	85 db                	test   %ebx,%ebx
    12a2:	7e 12                	jle    12b6 <memmove+0x26>
    12a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12b2:	39 da                	cmp    %ebx,%edx
    12b4:	75 f2                	jne    12a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    12b6:	5b                   	pop    %ebx
    12b7:	5e                   	pop    %esi
    12b8:	5d                   	pop    %ebp
    12b9:	c3                   	ret    

000012ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ba:	b8 01 00 00 00       	mov    $0x1,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <exit>:
SYSCALL(exit)
    12c2:	b8 02 00 00 00       	mov    $0x2,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <wait>:
SYSCALL(wait)
    12ca:	b8 03 00 00 00       	mov    $0x3,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <pipe>:
SYSCALL(pipe)
    12d2:	b8 04 00 00 00       	mov    $0x4,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <read>:
SYSCALL(read)
    12da:	b8 05 00 00 00       	mov    $0x5,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <write>:
SYSCALL(write)
    12e2:	b8 10 00 00 00       	mov    $0x10,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <close>:
SYSCALL(close)
    12ea:	b8 15 00 00 00       	mov    $0x15,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <kill>:
SYSCALL(kill)
    12f2:	b8 06 00 00 00       	mov    $0x6,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <exec>:
SYSCALL(exec)
    12fa:	b8 07 00 00 00       	mov    $0x7,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <open>:
SYSCALL(open)
    1302:	b8 0f 00 00 00       	mov    $0xf,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <mknod>:
SYSCALL(mknod)
    130a:	b8 11 00 00 00       	mov    $0x11,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <unlink>:
SYSCALL(unlink)
    1312:	b8 12 00 00 00       	mov    $0x12,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <fstat>:
SYSCALL(fstat)
    131a:	b8 08 00 00 00       	mov    $0x8,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <link>:
SYSCALL(link)
    1322:	b8 13 00 00 00       	mov    $0x13,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <mkdir>:
SYSCALL(mkdir)
    132a:	b8 14 00 00 00       	mov    $0x14,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <chdir>:
SYSCALL(chdir)
    1332:	b8 09 00 00 00       	mov    $0x9,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <dup>:
SYSCALL(dup)
    133a:	b8 0a 00 00 00       	mov    $0xa,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <getpid>:
SYSCALL(getpid)
    1342:	b8 0b 00 00 00       	mov    $0xb,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <sbrk>:
SYSCALL(sbrk)
    134a:	b8 0c 00 00 00       	mov    $0xc,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <sleep>:
SYSCALL(sleep)
    1352:	b8 0d 00 00 00       	mov    $0xd,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <uptime>:
SYSCALL(uptime)
    135a:	b8 0e 00 00 00       	mov    $0xe,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <shm_open>:
SYSCALL(shm_open)
    1362:	b8 16 00 00 00       	mov    $0x16,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <shm_close>:
SYSCALL(shm_close)	
    136a:	b8 17 00 00 00       	mov    $0x17,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    
    1372:	66 90                	xchg   %ax,%ax
    1374:	66 90                	xchg   %ax,%ax
    1376:	66 90                	xchg   %ax,%ax
    1378:	66 90                	xchg   %ax,%ax
    137a:	66 90                	xchg   %ax,%ax
    137c:	66 90                	xchg   %ax,%ax
    137e:	66 90                	xchg   %ax,%ax

00001380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	89 c6                	mov    %eax,%esi
    1387:	53                   	push   %ebx
    1388:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    138b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    138e:	85 db                	test   %ebx,%ebx
    1390:	74 09                	je     139b <printint+0x1b>
    1392:	89 d0                	mov    %edx,%eax
    1394:	c1 e8 1f             	shr    $0x1f,%eax
    1397:	84 c0                	test   %al,%al
    1399:	75 75                	jne    1410 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    139b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    139d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    13a4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    13a7:	31 ff                	xor    %edi,%edi
    13a9:	89 ce                	mov    %ecx,%esi
    13ab:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13ae:	eb 02                	jmp    13b2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    13b0:	89 cf                	mov    %ecx,%edi
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	f7 f6                	div    %esi
    13b6:	8d 4f 01             	lea    0x1(%edi),%ecx
    13b9:	0f b6 92 e9 17 00 00 	movzbl 0x17e9(%edx),%edx
  }while((x /= base) != 0);
    13c0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    13c2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    13c5:	75 e9                	jne    13b0 <printint+0x30>
  if(neg)
    13c7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    13ca:	89 c8                	mov    %ecx,%eax
    13cc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
    13cf:	85 d2                	test   %edx,%edx
    13d1:	74 08                	je     13db <printint+0x5b>
    buf[i++] = '-';
    13d3:	8d 4f 02             	lea    0x2(%edi),%ecx
    13d6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    13db:	8d 79 ff             	lea    -0x1(%ecx),%edi
    13de:	66 90                	xchg   %ax,%ax
    13e0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    13e5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13ef:	00 
    13f0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    13f4:	89 34 24             	mov    %esi,(%esp)
    13f7:	88 45 d7             	mov    %al,-0x29(%ebp)
    13fa:	e8 e3 fe ff ff       	call   12e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    13ff:	83 ff ff             	cmp    $0xffffffff,%edi
    1402:	75 dc                	jne    13e0 <printint+0x60>
    putc(fd, buf[i]);
}
    1404:	83 c4 4c             	add    $0x4c,%esp
    1407:	5b                   	pop    %ebx
    1408:	5e                   	pop    %esi
    1409:	5f                   	pop    %edi
    140a:	5d                   	pop    %ebp
    140b:	c3                   	ret    
    140c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1410:	89 d0                	mov    %edx,%eax
    1412:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    1414:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    141b:	eb 87                	jmp    13a4 <printint+0x24>
    141d:	8d 76 00             	lea    0x0(%esi),%esi

00001420 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1424:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1426:	56                   	push   %esi
    1427:	53                   	push   %ebx
    1428:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    142b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    142e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1431:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    1434:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1437:	0f b6 13             	movzbl (%ebx),%edx
    143a:	83 c3 01             	add    $0x1,%ebx
    143d:	84 d2                	test   %dl,%dl
    143f:	75 39                	jne    147a <printf+0x5a>
    1441:	e9 c2 00 00 00       	jmp    1508 <printf+0xe8>
    1446:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1448:	83 fa 25             	cmp    $0x25,%edx
    144b:	0f 84 bf 00 00 00    	je     1510 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1451:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1454:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    145b:	00 
    145c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1460:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    1463:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1466:	e8 77 fe ff ff       	call   12e2 <write>
    146b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    146e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1472:	84 d2                	test   %dl,%dl
    1474:	0f 84 8e 00 00 00    	je     1508 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
    147a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    147c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    147f:	74 c7                	je     1448 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1481:	83 ff 25             	cmp    $0x25,%edi
    1484:	75 e5                	jne    146b <printf+0x4b>
      if(c == 'd'){
    1486:	83 fa 64             	cmp    $0x64,%edx
    1489:	0f 84 31 01 00 00    	je     15c0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    148f:	25 f7 00 00 00       	and    $0xf7,%eax
    1494:	83 f8 70             	cmp    $0x70,%eax
    1497:	0f 84 83 00 00 00    	je     1520 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    149d:	83 fa 73             	cmp    $0x73,%edx
    14a0:	0f 84 a2 00 00 00    	je     1548 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14a6:	83 fa 63             	cmp    $0x63,%edx
    14a9:	0f 84 35 01 00 00    	je     15e4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14af:	83 fa 25             	cmp    $0x25,%edx
    14b2:	0f 84 e0 00 00 00    	je     1598 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14b8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14bb:	83 c3 01             	add    $0x1,%ebx
    14be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14c5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14c6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14cc:	89 34 24             	mov    %esi,(%esp)
    14cf:	89 55 d0             	mov    %edx,-0x30(%ebp)
    14d2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    14d6:	e8 07 fe ff ff       	call   12e2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14db:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14de:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14e8:	00 
    14e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ed:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14f3:	e8 ea fd ff ff       	call   12e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14f8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14fc:	84 d2                	test   %dl,%dl
    14fe:	0f 85 76 ff ff ff    	jne    147a <printf+0x5a>
    1504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1508:	83 c4 3c             	add    $0x3c,%esp
    150b:	5b                   	pop    %ebx
    150c:	5e                   	pop    %esi
    150d:	5f                   	pop    %edi
    150e:	5d                   	pop    %ebp
    150f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1510:	bf 25 00 00 00       	mov    $0x25,%edi
    1515:	e9 51 ff ff ff       	jmp    146b <printf+0x4b>
    151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1520:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1523:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1528:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    152a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1531:	8b 10                	mov    (%eax),%edx
    1533:	89 f0                	mov    %esi,%eax
    1535:	e8 46 fe ff ff       	call   1380 <printint>
        ap++;
    153a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    153e:	e9 28 ff ff ff       	jmp    146b <printf+0x4b>
    1543:	90                   	nop
    1544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1548:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    154b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    154f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
    1551:	b8 e2 17 00 00       	mov    $0x17e2,%eax
    1556:	85 ff                	test   %edi,%edi
    1558:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    155b:	0f b6 07             	movzbl (%edi),%eax
    155e:	84 c0                	test   %al,%al
    1560:	74 2a                	je     158c <printf+0x16c>
    1562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1568:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    156e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1571:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1578:	00 
    1579:	89 44 24 04          	mov    %eax,0x4(%esp)
    157d:	89 34 24             	mov    %esi,(%esp)
    1580:	e8 5d fd ff ff       	call   12e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1585:	0f b6 07             	movzbl (%edi),%eax
    1588:	84 c0                	test   %al,%al
    158a:	75 dc                	jne    1568 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    158c:	31 ff                	xor    %edi,%edi
    158e:	e9 d8 fe ff ff       	jmp    146b <printf+0x4b>
    1593:	90                   	nop
    1594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1598:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    159b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    159d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15a4:	00 
    15a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a9:	89 34 24             	mov    %esi,(%esp)
    15ac:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    15b0:	e8 2d fd ff ff       	call   12e2 <write>
    15b5:	e9 b1 fe ff ff       	jmp    146b <printf+0x4b>
    15ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    15c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15c8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    15cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15d2:	8b 10                	mov    (%eax),%edx
    15d4:	89 f0                	mov    %esi,%eax
    15d6:	e8 a5 fd ff ff       	call   1380 <printint>
        ap++;
    15db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15df:	e9 87 fe ff ff       	jmp    146b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    15e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15e7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    15e9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15eb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15f2:	00 
    15f3:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    15f6:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15f9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1600:	e8 dd fc ff ff       	call   12e2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    1605:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1609:	e9 5d fe ff ff       	jmp    146b <printf+0x4b>
    160e:	66 90                	xchg   %ax,%ax

00001610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1611:	a1 c4 1a 00 00       	mov    0x1ac4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1616:	89 e5                	mov    %esp,%ebp
    1618:	57                   	push   %edi
    1619:	56                   	push   %esi
    161a:	53                   	push   %ebx
    161b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    161e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1620:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1623:	39 d0                	cmp    %edx,%eax
    1625:	72 11                	jb     1638 <free+0x28>
    1627:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1628:	39 c8                	cmp    %ecx,%eax
    162a:	72 04                	jb     1630 <free+0x20>
    162c:	39 ca                	cmp    %ecx,%edx
    162e:	72 10                	jb     1640 <free+0x30>
    1630:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1632:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1634:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1636:	73 f0                	jae    1628 <free+0x18>
    1638:	39 ca                	cmp    %ecx,%edx
    163a:	72 04                	jb     1640 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    163c:	39 c8                	cmp    %ecx,%eax
    163e:	72 f0                	jb     1630 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1640:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1643:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1646:	39 cf                	cmp    %ecx,%edi
    1648:	74 1e                	je     1668 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    164a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    164d:	8b 48 04             	mov    0x4(%eax),%ecx
    1650:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1653:	39 f2                	cmp    %esi,%edx
    1655:	74 28                	je     167f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1657:	89 10                	mov    %edx,(%eax)
  freep = p;
    1659:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
}
    165e:	5b                   	pop    %ebx
    165f:	5e                   	pop    %esi
    1660:	5f                   	pop    %edi
    1661:	5d                   	pop    %ebp
    1662:	c3                   	ret    
    1663:	90                   	nop
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1668:	03 71 04             	add    0x4(%ecx),%esi
    166b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    166e:	8b 08                	mov    (%eax),%ecx
    1670:	8b 09                	mov    (%ecx),%ecx
    1672:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1675:	8b 48 04             	mov    0x4(%eax),%ecx
    1678:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    167b:	39 f2                	cmp    %esi,%edx
    167d:	75 d8                	jne    1657 <free+0x47>
    p->s.size += bp->s.size;
    167f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1682:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1687:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    168a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    168d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    168f:	5b                   	pop    %ebx
    1690:	5e                   	pop    %esi
    1691:	5f                   	pop    %edi
    1692:	5d                   	pop    %ebp
    1693:	c3                   	ret    
    1694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    169a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000016a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16a0:	55                   	push   %ebp
    16a1:	89 e5                	mov    %esp,%ebp
    16a3:	57                   	push   %edi
    16a4:	56                   	push   %esi
    16a5:	53                   	push   %ebx
    16a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16ac:	8b 1d c4 1a 00 00    	mov    0x1ac4,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b2:	8d 48 07             	lea    0x7(%eax),%ecx
    16b5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    16b8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16ba:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    16bd:	0f 84 9b 00 00 00    	je     175e <malloc+0xbe>
    16c3:	8b 13                	mov    (%ebx),%edx
    16c5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16c8:	39 fe                	cmp    %edi,%esi
    16ca:	76 64                	jbe    1730 <malloc+0x90>
    16cc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    16d3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    16d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    16db:	eb 0e                	jmp    16eb <malloc+0x4b>
    16dd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16e2:	8b 78 04             	mov    0x4(%eax),%edi
    16e5:	39 fe                	cmp    %edi,%esi
    16e7:	76 4f                	jbe    1738 <malloc+0x98>
    16e9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16eb:	3b 15 c4 1a 00 00    	cmp    0x1ac4,%edx
    16f1:	75 ed                	jne    16e0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    16f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16f6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16fc:	bf 00 10 00 00       	mov    $0x1000,%edi
    1701:	0f 43 fe             	cmovae %esi,%edi
    1704:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1707:	89 04 24             	mov    %eax,(%esp)
    170a:	e8 3b fc ff ff       	call   134a <sbrk>
  if(p == (char*)-1)
    170f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1712:	74 18                	je     172c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1714:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1717:	83 c0 08             	add    $0x8,%eax
    171a:	89 04 24             	mov    %eax,(%esp)
    171d:	e8 ee fe ff ff       	call   1610 <free>
  return freep;
    1722:	8b 15 c4 1a 00 00    	mov    0x1ac4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1728:	85 d2                	test   %edx,%edx
    172a:	75 b4                	jne    16e0 <malloc+0x40>
        return 0;
    172c:	31 c0                	xor    %eax,%eax
    172e:	eb 20                	jmp    1750 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1730:	89 d0                	mov    %edx,%eax
    1732:	89 da                	mov    %ebx,%edx
    1734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1738:	39 fe                	cmp    %edi,%esi
    173a:	74 1c                	je     1758 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    173c:	29 f7                	sub    %esi,%edi
    173e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1741:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1744:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    1747:	89 15 c4 1a 00 00    	mov    %edx,0x1ac4
      return (void*)(p + 1);
    174d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1750:	83 c4 1c             	add    $0x1c,%esp
    1753:	5b                   	pop    %ebx
    1754:	5e                   	pop    %esi
    1755:	5f                   	pop    %edi
    1756:	5d                   	pop    %ebp
    1757:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1758:	8b 08                	mov    (%eax),%ecx
    175a:	89 0a                	mov    %ecx,(%edx)
    175c:	eb e9                	jmp    1747 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    175e:	c7 05 c4 1a 00 00 c8 	movl   $0x1ac8,0x1ac4
    1765:	1a 00 00 
    base.s.size = 0;
    1768:	ba c8 1a 00 00       	mov    $0x1ac8,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    176d:	c7 05 c8 1a 00 00 c8 	movl   $0x1ac8,0x1ac8
    1774:	1a 00 00 
    base.s.size = 0;
    1777:	c7 05 cc 1a 00 00 00 	movl   $0x0,0x1acc
    177e:	00 00 00 
    1781:	e9 46 ff ff ff       	jmp    16cc <malloc+0x2c>
    1786:	66 90                	xchg   %ax,%ax
    1788:	66 90                	xchg   %ax,%ax
    178a:	66 90                	xchg   %ax,%ax
    178c:	66 90                	xchg   %ax,%ax
    178e:	66 90                	xchg   %ax,%ax

00001790 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1790:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1791:	b9 01 00 00 00       	mov    $0x1,%ecx
    1796:	89 e5                	mov    %esp,%ebp
    1798:	8b 55 08             	mov    0x8(%ebp),%edx
    179b:	90                   	nop
    179c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17a0:	89 c8                	mov    %ecx,%eax
    17a2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17a5:	85 c0                	test   %eax,%eax
    17a7:	75 f7                	jne    17a0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17a9:	0f ae f0             	mfence 
}
    17ac:	5d                   	pop    %ebp
    17ad:	c3                   	ret    
    17ae:	66 90                	xchg   %ax,%ax

000017b0 <urelease>:

void urelease (struct uspinlock *lk) {
    17b0:	55                   	push   %ebp
    17b1:	89 e5                	mov    %esp,%ebp
    17b3:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17b6:	0f ae f0             	mfence 

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17b9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17bf:	5d                   	pop    %ebp
    17c0:	c3                   	ret    
