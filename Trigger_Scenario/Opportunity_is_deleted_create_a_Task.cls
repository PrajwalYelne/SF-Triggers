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
    set<ID>
