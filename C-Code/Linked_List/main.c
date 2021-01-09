//Linked list insert access delete update search sort
#include <stdio.h>
#include <stdlib.h>
#include "list.h"



int main ()
{
List new_list;                           // intialize list called new list
create_list(&new_list);                  // create the new list
  int i, data, pos;                      // intialize variables calle i, data, pos

    do                              // do while loop if i not equal 8
    {
                                // print the options menu
        printf("\n                  _________________________________________________________\n");
        printf("                            1. Insert At The Linked List.\n");
        printf("                            2. Delete An Element From The Linked List.\n");
        printf("                            3. Print The Linked List.\n");
        printf("                            4. Search The Linked List.\n");
        printf("                            5. Update The Linked List.\n");
        printf("                            6. Access An Element From The Linked List.\n");
        printf("                            7. Sort The Linked List.\n");
        printf("                            8. Exit\n");
        printf("                  _________________________________________________________\n");
        printf("                  _________________________________________________________\n");

        printf("Enter Your Choice : ");   //ask  the user to choose his choice
        scanf("%d", &i);                    //take the user desicion and put it to i variable

        switch(i)                            //switch case checking th value of i
        {
        case 1:                              // if i =1
          printf("Enter A Value For The Element : ");   // ask the user to enter the value that he want to insert
          scanf("%d", &data);                       //store the value in variable data
          printf("Enter The Position : ");         //ask the user to enter the position
          scanf("%d",&pos);                        // store the position in variable pos
          if(pos <= size_list(&new_list)&&pos>=0)   // check if the position less than or equal the size AND the position is greater than zero
          insert_to_list(data,pos,&new_list);        // insert in the list
          else                      // else
            printf("error");                              // print error

          break;                       // break

        case 2:                             // if i =2
            printf("Enter The Position You Wanna Delete : ");
            scanf("%d",&pos);
            if(pos <size_list(&new_list)&&pos>=0)
            {delete_from_list(pos ,&new_list);
            printf("Value Was Deleted Successfully");}
            else
            printf("error");           // print error
          break;                     // break

        case 3:                         // if i =3
          print(&new_list);            // call print function
          break;                     // break

        case 4:                         // if i =4
            printf("Enter The Value You Wanna Search : ");    // ask the user to enter the value that he want  to search about
            scanf("%d",&data);                     // put the value in data variable
            pos = search_list(&new_list,data);     // let pos equal the value of calling the search_list function
            if(pos==-1)                         // check if pos = -1
                printf("the value not found");   //print the value not found
            else                //  else
            printf("The Value Was Found In Position : %d \n",pos);   //print the position
            break;                   // break

        case 5:                             // if i =5
            printf("Enter The Position You Wanna Update : "); // ask the user to enter the position that he want to update
            scanf("%d",&pos);                        // store the position from user in pos variable
           if(pos < size_list(&new_list)&&pos>=0)       // check if position is less than the size of list && pos is greater than or equal zero
            {
            printf("Enter Your Value : ");            // ask the user to enter the new value
            scanf("%d",&data);                       // store the new value in data variable
            update_list(&new_list,pos,data);       // call the update_list function
            printf("Value Was Updated Successfully");} // print the updae is done and end the condition
            else
                printf("error");        // print error
            break;                   // break

        case 6:                         // if i =6
            printf("Enter The Position Of The Element You Wanna Access : "); // ask the user to enter the position that he want to access
            scanf("%d",&pos);                    // store the position from user in pos variable
            if(pos < size_list(&new_list)&&pos>=0){   // check if position is less than the size of list && pos is greater than or equal zero
            data = access_list(pos,&new_list);     //return the value of calling the access_list function in data variable
            printf("The Value Of This Element Is %d",data);} //print the value of the position and end the condition
            else                        //else
                printf("error");       // print error
            break;                       // break

        case 7:                         // if i =7
            if(sort_list(&new_list))    //check the lis is empty or not
                printf("The List Has Been Sorted");  // print the kist is sorted
            else            // else
                printf("the list is empty");        //print the list is empty
            break;                   // break

        case 8:                         // if i =8
            exit(0);                       // call function exit
        }
    }while(i!=8);      //condition of loop that i not equal 8
  return 0;                         //return 0 after terminate
}

