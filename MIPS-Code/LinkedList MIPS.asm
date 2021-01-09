				#########################################################
				#-------------------------------------------------------#
				#-		 Project Name: Linked List             -#
				#				                       -#						
				#-   		       Description:	               -#			 
				#-       This Program Demonstrates How To Insert,      -#
				#- 	   Delete, Sort, Search, Update, Access        -#
				#-	         And Print A Linked List. 	       -#
				#-------------------------------------------------------#
				#-------------------------------------------------------#
				#########################################################
								
#----------------------------------------------------------------------------------------
#----- Constants

.data
	Enter_Value: 		.asciiz "Enter A Value For The Element : "
	Scan_Pos: 		.asciiz "Enter The Position : "
	error_msg: 		.asciiz "Error!"
	Enter_Position: 	.asciiz "Enter YAQour Position: "
	emptyList:  		.asciiz "The List Is Empty"
	Sorted:			.asciiz "The List Was Sorted"
	sep:            	.asciiz "  "

	valueDeleted: 		.asciiz "Element  deleted successfully \n"
	options:   		.asciiz "\n1. Insert At The Linked List.\n2. Delete An Element From The Linked List.\n3. Print The Linked List.\n4. Search The Linked List.\n5. Update The Linked List.\n6. Access An Element From The Linked List.\n7. Sort The Linked List.\n8. Exit.\n"
	insertmsg:    		.asciiz "\nEnter Your Choice: "
	first:        		.word 0 
	size:         		.word 0 
	pos:          		.word 0
  
#------------------------------------------------------------------------------------------------------------------------------------------#
#----- Constants


.text

main:

jal Scan_Input 
	
		
#--------------------------------------------------------#
# optionMenu Choose what to do based on user choice in t0
#--------------------------------------------------------#


		beq		$t0, 1, Insert_To_List
		beq		$t0, 2, Delete_From_List
		beq		$t0, 3, Print_The_List
		beq		$t0, 4, Search_The_List
		beq    		$t0, 5, Update_The_List 
		beq		$t0, 6, Access_The_List
		beq		$t0, 7, Sort_The_List
		beq		$t0, 8, Exit


#--------------------------------------------------------#
# Syscall to exit the program 
#--------------------------------------------------------#	


Exit:
	li	$v0, 10
	syscall
	
	
#--------------------------------------------------------#
#----- Functions Implementation		


 Insert_To_List:
#----------------------

	jal Scan_Insert_Value  
		
		lw   $t6, size 					#load size in t6
		bgt  $a1,$t6,Error_msg				#check about the position //a0 position 
		blt  $a1,$zero,Error_msg			#check it if it is negative 
		add  $t7,$a0,$zero				#move a0(the value)to t7 // t7 is temp 
	
		li $v0, 9 					#alocate in memory
		li $a0, 8					#with 8 bit
		syscall 
		move $t1 , $v0 					#move the adress to t1 // t1 is the adress of the new node 
		add $a0,$t7,$zero				#move t7 to a0 again to get the value 
		lw $a2, first     				# The address of the first node 
	   
	Cont: 
		sw $a0, 0($t1)  				#$t1 Is The new Node ,  $a0, Value Of $t1 // store thwe value int the data section of the new node
		sw $zero, 4($t1) 				#make it points to null  
		
		beq $a1, $zero , Update_First  			#check the position equal zero 
		addi $a1, $a1, -1		     		#decrement the position 1 in $a1 
		li $t3, 0			      	        #$t3 is counter 
		move $t4, $a2			      	        #t4 pointer to loop 
		
	Loop: 
		beq $a1, $t3, Move  				#if position-== the counter go to Move
		addi $t4, $t4, 4 				#increament the pointer // t4 is pointer and t4 +4 is the adress of the next
		lw $t4, 0($t4)  				#LOAD the address of the next node  // the next 
		addi $t3, $t3, 1 				#incremant the counter
		j Loop 
		

	# if there is node and want to put node in position 0 
	Update_First:
		move $t2,$a2 					#move a2 to t2 as a temp 
		sw $t1, first					#store t1 in frist to update it // t1 is the adress of the new node
		sw $t2, 4($t1) 					#store the temp to next in the node // make the it the next in the new node
		lw $t9,size 					#load the size to t9 
		addi $t9,$t9,1 					#incremint the t9
		sw $t9,size  					#store the new size 
	j main 							#return main
		
		
	Move:
		addi $t4,$t4,4					#store the next in t4 
		lw $t5, 0($t4) 					#load the adress of the next node 
		sw $t5, 4($t1) 					#store t5 in the next of t1
		sw $t1, 0($t4) 					#store the adress of the new node 
		lw $t9,size 					#load the size in t9
		addi $t9,$t9,1 					#incremint the t9 
		sw $t9,size 					#store t9 in size
		j main 
		
#------------------------------------------------------------------------------------------------------------------------------------------#		
 Delete_From_List:
#---------------------- 
	
	lw $t9,size  			 	    		#load size in $t9
	beq $t9,$0,Error_msg   	        			#if list is empty then print error
	lw $a1,first				    		#load first node in the list in $a1
	syscall	
		
			
	#Print delete Message 	
	li $v0,4 	
	la $a0,Scan_Pos		
	syscall 	
			
	#Scan Position 	
	li $v0, 5	
	syscall	
	move $a0, $v0	      	  	    			#Store The Input in $a0
		
		
	slt $t0,$t9,$a0						#if position > size set $t0=1
	beq $t0,1,Error_msg					#if $t0=1 then print error message
			
	slt $t0,$a0,$zero					#if position < 0 set $t0=1
	beq $t0,1,Error_msg					#if $t=1 then print error message
	
			
	addi $t0,$0,0 						#i=0
	beq $a0,$0,deletefirstnode				#if(pos==0) then go to deletefirstnode
#else	
	lw $t2,0($a1)						#q=M[a1+0]// q=pl->head
	addi $t3,$a0,-1 					#decrement position by 1// $t3=pos=pos-1
	
	loop:	
		  slt $t4,$t0,$t3				#if(i<pos-1) set $t4=1
		  beq $t4,$0,exitloop				#if ($t4=0) then exit loop
		  lw $a2,4($a1)					#$a2=M[$a1+4]// q=q->next
		  addi $t0,$t0,1				#i++
		  j loop 					#Loop again
	
	exitloop:	
		  lw $a3,4($a2)					#$a3=M[$a2+4]// t5=q->next
		  lw $t5,4($a3)					#temp=M[$a3+4]// temp=q->next->next
		  sw $t5,4($a2)					#M[$a2+4]=$t5// q->next=temp
		  j decsize	
	
	deletefirstnode:	
		  lw $t1, 4($a1)				#temp=M[$a1+4]// temp=pl->head->next
		  sw $t1,first					#first = temp// pl->head=temp
	
	decsize:	
		  lw $t6,size					#load size into register
		  addi $t6,$t6,-1 				#size--
		  sw $t6,size					#save the new value of size
		  li $v0,4 	
		  la $a0,valueDeleted				#print value deleted
		  syscall 	
			
	j main					        	#jumb to the main
	
#------------------------------------------------------------------------------------------------------------------------------------------#
 Print_The_List:
#----------------------
		
	lw     $a1, first	 	 		  	# Get A Pointer To The First Node
	li     $t0,0						# Initialize A Flag To Check If Any Print Happend
	
	Print_List:		
		  bne    $a1, $zero, Loop_Val   	  	# While The Pointer Is Not NULL, Execute Loop precudure
		  beq    $a1, $zero, Empty 	  	  	# else Pointer Points On a Null, Execute Empty precudure
			
	Loop_Val:  	
		  lw     $a0,0($a1)     	     	  	# Get The Data Of This Node in $t1
		  li     $v0,1   			     	# Print That Data 
    		  syscall             	
    		  la     $a0,sep        	    	  	# Print Separator
		  li     $v0,4          	
   		  syscall     	
		
		  lw     $a1,4($a1)     		        # Get The Pointer To The Next Node	
        	  li     $t0,1					# Since The "Loop_Val" Was Entered Then The Flag Is Rised 
		  j      Print_List 				# Return To Check Pointer Position	
	
	Empty:	
		  bne    $t0, $zero , main          		# If The Flag != Zero Then Don’t Print The emptyList Message 
		  la     $a0, emptyList	    	  		# Otherwise Print That The List Is Empty 
		  li     $v0,4					# Print The emptyList Message
		  syscall							  	
		
		j main						# Return To Main
		
#------------------------------------------------------------------------------------------------------------------------------------------#
 Search_The_List:
#----------------------

	jal Print_Message_Scan
	lw $a0,first
		
   	 addi $t0,$0,0     					#i=0 counter
   	 add $t1,$0,-1    					#found = -1
					
    	loop_search:			
	  	   beq $a0,$0,exit  				# condition if the header points to null exit from the loop 		
	   	   lw $t3,0($a0)    	    			#load the value stored in the pointed node in t3	
	  	   beq $t3,$a1,exit_if   			#if the value stored in the node equal to the value passed from the main go to the else condition		
	   	   addi $a0,$a0,4  	    			#pointes to the address cointains address of the next node
	  	   lw $a0,0($a0)   	    			#access the address of the next node
	  	   addi $t0,$t0,1  	    			#i++   
	j loop_search   					#jump to the loop
    	
    	exit:		
           	   #return found					
          	   add $a0,$t1,$0		
         	   li $v0,1			
         	   syscall		
				
   		 j main		
		
    	exit_if: 		
          	   addi $t1,$t0,0       			#store the value of counter at found
          	 j exit         	    			#jump tp exit to return the found
		
#------------------------------------------------------------------------------------------------------------------------------------------#
 Update_The_List:
#----------------------

          jal Scan_Insert_Value

          addi $t0,$0,0       		  		        #counter = 0 
          lw   $a2,first       		 	       		#pointer to the head    #lw $t2,0(a0)
          lw   $t1,size         	   		        #size of the list

          slt $t3,$t1,$a1    				        #if size<pos return 1
          bne $t3,0,Error_msg    			        #if it is not equal 0 then print error message
          slt $t4,$a1,$0     				        #if pos <0 return 1
          bne $t4,0,Error_msg    	   			#if the returned not eqyal zero then the position is is less than 0 and print error message

          beq $a1,0 ,update_zero      				#if position ==0 go to update_zero
	   
	loop_update: 
         	   blt $t0,$a1, continue_loop_u 		#compare if the counter is less than the position if true continue_loop
        	   sw $a0,0($a2)    			        #else then 
         	 j main

	update_zero:
         	   sw $a0,0($a2) 	           		#put  the new  value scanned in main  in q->head->data
          	 j main
	
	continue_loop_u:      
		   addi $a2,$a2,4  		          	#move the pointer to store the value of the addresse of the next node
		   lw $a2,0($a2)  		       		#the pointer shifted to the next node
		   addi $t0,$t0,1 			 	#i++
	         j loop_update          	  	        #jump to the loop 



	j main
	
#------------------------------------------------------------------------------------------------------------------------------------------#
 Access_The_List:
#----------------------

	lw $a2, size                        		        #set size to register a2
	lw $a1, first                      			#set first addresss to register a1
	jal Scan_Access_Position           			#scan the position to register a0
	slt $t3, $s0, $a2                  			#check if pos > size
	beq $t3, $zero,  ErrorA            		        #print error if pos > size
   	beq $s0,$zero ,Return_Data       		        #if(pos == 0) {r}
	add $t0,$zero,0 		     	   	        #intialize i = 0 in register t0
		
	loopAccess: 					        #for loop / else
		  slt $t2,$t0,$s0		  	  	#if (i< pos) loop condition
		  beq $t2,0,Return_Data         		#else  if(i !< pos)
		  lw $a1, 4($a1)		  	  	#else point to the next node  q = q->next   
		  add $t0,$t0,1 		  	   	#increament i by 1
		j loopAccess				  	#jump loop
        
	ErrorA:
           	  li $v0, 4 
		  la $a0,error_msg
		  syscall
		j main

	Return_Data: 
          	  lw $a0, 0($a1)		    		#set the data to a register 
		  li $v0, 1                   		        #print the data
		  syscall
		j main 

#------------------------------------------------------------------------------------------------------------------------------------------#	
 Sort_The_List:
#----------------------
	lw $t0,first    #pl
	lw $t1,first	#pi
	lw $t2,first	#pj
	
		
	bne $t0,$zero,Loop_Sort1     	  			# (pl->head) True
	j Error_msg	
		
		
		
	Loop_Sort1:	
		bne $t1,$zero,Loop_Sort2 	  		# pi True
		li $v0, 4	
		la $a0, Sorted	
		syscall	
	      j main
		
		
		
	Loop_Sort2:	
		addi $t3,$t2,4				   	# pj->next
		bne  $t3,$zero,Body_Loop_Sort2 		        # (pj->next) True
		move $t2,$t0	
		lw   $t1,4($t1)	
	     j Loop_Sort1
		
		
	Body_Loop_Sort2:			
		lw   $t4, 0($t2)			        #pj->data 
		lw   $t5, 0($t3)  			
		lw   $t6, 0($t5)    			        #pj->next->data 			
		bgt  $t4, $t6, Swap
		lw   $t2, 4($t2)	
	
	Swap: 
		move  $t7,$t4 					# $t7 temp = pj->data
		sw    $t6, 0($t2)
		sw    $t7, 0($t5)
		lw    $t2, 4($t2)	
	      j Loop_Sort2
		
	
#------------------------------------------------------Global Used Functions----------------------------------------------------------------#

	
 Scan_Input: 
#----------------------
	#Print The Options
	li $v0, 4
	la $a0, options
	syscall
	
	#Ask For The Input 
	li $v0, 4
	la $a0, insertmsg
	syscall
	
	#Get The User’s Input
	li $v0, 5
	syscall
	
	#Store The Input in t0 
   	 move $t0, $v0
		
	jr $ra 		#return 
	
 Scan_Insert_Value:
#----------------------
	#Print Message 
	li $v0,4 
	la $a0,Enter_Value
	syscall 
	
	#Scan Value 
	li $v0, 5
	syscall

	#Store The Input in t0
	move $t0, $v0

	
	#Print Message 
	li $v0,4 
	la $a0,Scan_Pos
	syscall 
	
	move $a0 ,$t0
	#Scan Position 
	li $v0, 5
	syscall
	
	#Store The Input in a1
	move $a1, $v0
		
	jr $ra 		#return

 Scan_Access_Position:
#----------------------
	
	#Print Message 
	li $v0,4 
	la $a0,Enter_Position 
	syscall 
	
	#Scan Value 
	li $v0, 5
	syscall
	
	#Store The Input in s0
    add $s0, $v0, $zero
		
	jr $ra 		#return
	

 Print_Message_Scan:
#----------------------

	li $v0,4 
	la $a0,Enter_Value
	syscall 
	
	#Scan Value 
	li $v0, 5
    	syscall
	
	#Store The Input in a0
	move $a1, $v0
	jr $ra
	
	j main
	
 Error_msg:
#----------------------
		
	li $v0, 4 						#LOAD  4 in v0
	la $a0,error_msg					#put the value of msg in a0 to print
	syscall						   	#print
	j main						        #return to the main

#-------------------------------------------------------#
#----#       	    LINKED LIST END         	   #----#
#-------------------------------------------------------#
