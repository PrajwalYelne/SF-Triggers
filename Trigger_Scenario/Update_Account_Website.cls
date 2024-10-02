// Every time an account website is updated, update the website field on all its child contacts 

//AccountTrigger 

trigger AccountTrigger on Account (before update, after update) { 

     

    if (Trigger.isAfter && Trigger.isUpdate){ 

     AccountTriggerHandler.handleAfterUpdateActivities(Trigger.New, Trigger.oldMap);    

    } 

} 


//AccountTriggerHandler
public class AccountTriggerHandler { 
     public static void handleAfterUpdateActivities(List<Account> newRecords, Map<Id,Account> oldMap){ 

        Map<Id,String> accToWebsiteMap = new Map<Id,String>(); 

        for (Account acc : newRecords){
          if(acc.Website != oldMap.get(aac..Id).Website){
             accToWebsiteMap.
