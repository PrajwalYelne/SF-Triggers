//Create Contact records based on Create N Contacts field on the Account record  

AccountTrigger 
 
trigger AccountTrigger on Account (After update, After insert) {

 if (Trigger.isAfter && Trigger.isUpdate){
 AccountTriggerHandler.handlerAfterInsertActivities(Trigger.New,Trigger.oldMap);
 }
}


AccountTriggerHandler  
public class AccountTriggerHandler{

public static void handlerAfterInsertActivities(List<Account> newRecords){
  List<Contact> conList = 
