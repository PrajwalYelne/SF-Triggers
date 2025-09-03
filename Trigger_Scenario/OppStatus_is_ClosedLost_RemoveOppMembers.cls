//As soon as Opportunity is Closed Lost, remove all Opportunity Team Members from the Opportunity 

trigger OpportunityTrigger on Opportunity (before insert, after delete, after update){
  if(Trigger.isUpdate && Trigger.isAfter){
    OpportunityTriggerHandler.handleActivtiesAfterUpdate(Trigger.New);
  }
}

public class OpportunityTriggerHandler{
 public static void handleActiviti
