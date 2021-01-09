#ifndef LIST_H_INCLUDED
#define LIST_H_INCLUDED
typedef struct listnode
{
    int data;
    struct listnode *next;

}ListNode;

typedef struct list
{
    ListNode *head;
    int size;

}List;


void insert_to_list(int, int, List*);
void traverse(List*);
void delete_from_list(int, List*);
int sort_list(List*);
void update_list(List*, int, int);
int search_list(List *, int);
int access_list(int, List*);
void create_list(List *);
int size_list(List *);
#endif // LIST_H_INCLUDED
