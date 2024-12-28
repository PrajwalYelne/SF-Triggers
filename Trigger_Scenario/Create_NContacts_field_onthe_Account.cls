//Create Contact records based on Create N Contacts field on the Account record  

AccountTrigger 
 
trigger AccountTrigger on Account (After update, after insert) { 

    if (Trigger.isAfter && Trigger.isUpdate){ 
     AccountTriggerHandler.handleAfterInsertActivities(Trigger.New, Trigger.oldMap);
    } 
} 


AccountTriggerHandler  
public class AccountTriggerHandler { 

public static void handleAfterInsertActivities(List<Account> newRecords){ 
    	List<Contact> conList = new List<Contact>(); 
        for(Account acc : newRecords){ 
            if(acc.CreateNContact != Null){ 
                for(Integer i = 0; i < acc.CreateNContact; i++){ 
                Contact con = new Contact(); 
                con.LastName = acc.Name + i; 
                con.AccountId = acc.Id; 
                conList.add(con); 
             } 
           }   
        } 

        if(!conList.isEmpty()){ 
            insert conList; 
        } 
    } 
} 
