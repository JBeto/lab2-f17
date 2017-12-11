#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct shm_page {
    uint id;
    char *frame;
    int refcnt;
  } shm_pages[64];
} shm_table;

void shminit() {
  int i;
  initlock(&(shm_table.lock), "SHM lock");
  acquire(&(shm_table.lock));
  for (i = 0; i< 64; i++) {
    shm_table.shm_pages[i].id =0;
    shm_table.shm_pages[i].frame =0;
    shm_table.shm_pages[i].refcnt =0;
  }
  release(&(shm_table.lock));
}

int shm_open(int id, char **pointer) {
int i;
struct proc *curproc = myproc();

acquire(&shm_table.lock);
for(i = 0; i < 63; ++i)
{
  if(shm_table.shm_pages[i].id == id)
  {
    if(mappages(curproc->pgdir, (char*)curproc->sz, PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U) < 0)
    {
      cprintf("Error\n");
      release(&shm_table.lock);
      return -1;
    }
    shm_table.shm_pages[i].refcnt++;
    *pointer = (char*)curproc->sz;
    curproc->sz += PGSIZE;
    release(&shm_table.lock);
    return 0;
  }
}
for(i = 0; i < 63; ++i)
{
  if(shm_table.shm_pages[i].id == 0)
  {
    shm_table.shm_pages[i].id = id;
    shm_table.shm_pages[i].frame = kalloc();
    memset(shm_table.shm_pages[i].frame,0, PGSIZE);
    shm_table.shm_pages[i].refcnt = 1;

    if(mappages(curproc->pgdir, (char*)curproc->sz, PGSIZE, V2P(shm_table.shm_pages[i].frame), PTE_W|PTE_U) < 0)
    {
      cprintf("Error\n");
      release(&shm_table.lock);
      return -1;
    }
    *pointer = (char*)curproc->sz;
    curproc->sz += PGSIZE;
    release(&shm_table.lock);
    return 0;
  }
  release(&shm_table.lock);
}
return 0; //added to remove compiler warning -- you should decide what to return
}


int shm_close(int id) {
int i;

acquire(&shm_table.lock);
for(i = 0; i < 63; ++i)
{
  if(shm_table.shm_pages[i].id == id)
  {
    if(shm_table.shm_pages[i].refcnt - 1 == 0)
    {
      shm_table.shm_pages[i].id = 0;
      shm_table.shm_pages[i].frame = 0;
      shm_table.shm_pages[i].refcnt = 0;
      release(&shm_table.lock);
    }
    else
    {
      shm_table.shm_pages[i].refcnt -= 1;
      release(&shm_table.lock);
    }
  }
}
return 0; //added to remove compiler warning -- you should decide what to return
}
