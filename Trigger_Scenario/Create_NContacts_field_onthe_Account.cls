//Create Contact records based on Create N Contacts field on the Account record  

AccountTrigger 
 
trigger AccountTrigger on Account (After update, after insert) {

 if (Trigger.isAfter && Trigger.isUpdate){
AccountTriggerHandler.handlerAfterInsertActivities(Trigger.New,Trigger.oldMap);
