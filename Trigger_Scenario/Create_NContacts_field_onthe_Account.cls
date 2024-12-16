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
  List<Contact> conList = new List<Contact>();
for(Account acc: newRecords){
 if(acc.CreateNContact != Null){
  for(Integer i = 0; i < acc.CreanteNContact; i++){
   Contact con = new Contact();
   con.LastName = acc.Name + I;
   con.AccountId = acc.Id;
   conList.add(con);
