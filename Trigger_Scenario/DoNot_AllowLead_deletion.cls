// Do not allow Lead deletion if the status is Working Contacted 
//LeadTrigger 

trigger LeadTrigger on Lead (before delete) {

  if(Trigger.isDelete && Trigger.isBefore){
    LeadTriggerHandler.handleActivitiesBeforeDelete(Trigger.OLD);
