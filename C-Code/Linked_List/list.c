#include<stdlib.h>
#include "list.h"
int size_list(List *pl)
{
    return pl->size;    // return the size of the list
}
void create_list(List *pl)    // intialize the list
{
    pl->head=NULL;            // let head to be null
    pl->size=0;               // let the size to be zero
}
void insert_to_list(int value , int pos , List *pl )  // start of function
{
 ListNode *q , *p;                                  //create 2 pointers of type ListNode p&q
 int i;                                             // intialize i
 p = (ListNode *)malloc(sizeof(ListNode));          // create a node to insert it  called p
 p->data=value;                                     // set the data of p node to the value parameter
 p->next=NULL;                                      // set the next to be null
  if(pos==0)                                        // condition if pos of insertion equal zero
  {
    p->next=pl->head;                                // let the next pointer of p to point on the head of the list
    pl->head=p;                                      //  let head to point on p node

    pl->size++;                                        // increament size of list by 1
  }                                                     // end of condition
  else if(pos<=pl->size)                                   //else if position is letter than or equal the size
    {                                               // start of condition
     for(q=pl->head , i=0 ; i<pos-1 ; i++)     // start loop from i = 0 & q pointer point on head , with condition i < position -1 ,and increament i by 1 every time
     {                                              // start of node
            q=q->next;                              // let q pointer point on the next node
     }                                              // end of loop
     p->next=q->next;                               //let the next node of pointer p to be  the next node of pointer q
     q->next=p;                                     // let the next op pointer q to point on the p node

     pl->size++;                                           // increament size of list by 1
    }                                                   // end of condition
    else                                                  // else
        printf("This Operation Is Not Applicable, The Current List Size Is %d",pl->size);  //print if the position cant be reached
}                                               // end of function

void print(List *pl)              // Start the function
{
    ListNode *p = pl->head;        // let the pointer p point to head
    while(p)                       //loop with condition  p not equal null
    {
        printf("%d\t",p->data);    // print the data in the node that pointer p point on it
        p=p->next;                 // let pointer p point on the next node
    }                              // end of loop
}                                  // end function


void delete_from_list(int pos, List *pl)
{
    int i;			//initialize the counter
    ListNode *q , *tmp;		//create pointers q and tmp from ListNode type
    if(pos==0)			//if the position is of the first node
    {
        tmp = pl->head->next;	//make tmp points to next node(the second node)
        //free(pl->head);
        pl->head = tmp;		//make the head points to the second node to (became first node)
    }
    else
    {
        for((q=pl->head , i=0) ; i<pos-1 ; i++)		//make q points to the node and loop until it reach position-1
        {
            q=q->next;					//move pointer q to the next node
        }
        tmp = q->next->next;				//move tmp pointer two steps
        //free(q->next);
        q->next=tmp;					//make the node points to the node after it by 2 steps
    }
    pl->size--;						//decrement List size by 1
}

void update_list(List *pl , int pos , int new_value)   //the function takes parameters pointer to the list and the position of the node and the updated value
{
    int i;                                                //counter
    ListNode *q;                                          //pointer to the node
    if(pos==0)                                           //checking if the position is 0
    {
        pl->head->data = new_value;                      //accessing the data in the node the header is pointing at  and updated it with the new value
    }
    else                                                //if the position is greater than 0
    {
        for ((q=pl->head , i=0) ; i<pos ; i++)          // q pointing to the node  and check until the counter is less than position
        {
             q=q->next;                                 //move the pointer to the next node
        }
        q->data = new_value;                            //after finishing iteration put the updated value in the node
    }
}


int search_list(List *pl , int value)
{
    ListNode *q ;
    int i , found= -1;                       // counter, found will be the pos number
    for((q=pl->head , i=0) ; q!= NULL ; i++) //looping over the list to find user's value
    {
        if(q->data == value)                //if value was found
        {
            found = i;                     //pos equals counter if val was found
            break;
        }
        q=q->next;                        //go to the next node
    }
    return found;                         //return found=-1 if the value wasn't found or return found=counter(pos number)
}
int sort_list(List *pl)
{
    ListNode *pi=pl->head,*pj=pl->head;   //pointers to loop
    int temp;                             //temp to swap
    if(pl->head)                          //check if the list is exist
    {
        while(pi)                         // loop in all list
        {
            while(pj->next)               // loop to compare the element with all
            {
                if(pj->data > pj->next->data)   // compare the data with the next data
                {
                    temp=pj->data;              //save the data to the temp
                    pj->data=pj->next->data;    //save the data of next to the data
                    pj->next->data=temp;        //save the temp to the data of the next
                    pj=pj->next;                // move the pointer to the next

                }
                else
                    pj=pj->next;                // move the pointer to the next
            }
            pj=pl->head;                        //to start from first
            pi=pi->next;                        //move to the next
        }
        return 1;                               // if it sorted
    }
    else
        return 0;                               //if it not sorted

}

int access_list(int pos, List *pl)                //start function
{
    ListNode *q;                                  //intialize pointer q of type Listnode
    int i;                                        //intialize counter i
    if(pos==0)                                    //if positio is zero
            return (pl->head->data);              // return the data in the head
     else                                         // else
     {
         for((q=pl->head , i=0) ; i<pos ; i++)     //loop start from i=0,and head node  with condition if i < pos , and increament i by 1 after each time
         {
             q=q->next;                            // let q to point to the next node
         }
         return q->data;                           // return the data in the node that pointer q point on it
     }
} // end of function



