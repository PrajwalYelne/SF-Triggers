// As soon as an Opportunity is deleted, create a Task for the Opportunity’s parent Account Owner

trigger OpportunityTrigger on Opportunity (before insert, after delete) { 
  if(Trigger.isDelete && Trigger.isAfter){
      OpportunityTriggerHandler.handleActivitiesAfterDelete(Trigger.Old);

