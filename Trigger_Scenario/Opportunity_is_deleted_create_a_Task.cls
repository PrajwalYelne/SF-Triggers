// As soon as an Opportunity is deleted, create a Task for the Opportunity’s parent Account Owner

//OpportunityTrigger
trigger OpportunityTrigger on Opportunity (before insert, after delete) { 
  if(Trigger.isDelete && Trigger.isAfter){
      OpportunityTriggerHandler.handleActivitiesAfterDelete(Trigger.Old);
    }
  }

//OpportunityTriggerHandler
public class OpportunityTriggerHandler { 
  public static void handleActivitiesAfterDelete(List<Opportunity> oldRecords){
    Set<Id> accountIds  new Set<Id>();
    Map<Id, Id> OppvsAccountMap = new Map<Id, Id>();
    Map<Id,Id> accIdvsOwnerIdMap = new Map<Id, Id>();
    for(opportunity opp : oldRecords){
      accountIds.add(opp.AccountId);
      oppvsAccountMap.put(opp.Id, opp.AccountId); 
    }
  List<Account> AccountRecords = [SELECT Id, OwnerId FROM Account WHERE Id IN:accountIds];
  for(Account acc: accountRecords){
    accIdvsOwnerIdMap.put(acc.Id, acc.OwnerId);
  }

  List<Task>taskRecList = new List<Task>();
  for(Opportunity oppRec : oldRecords){
    Task taskRec = new Task();
    taskRec.Description = 'New Task Created to investigate why opportunity was deleted';
    taskRec.Priority = 'High';
    taskRec.O
