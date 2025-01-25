// Do not allow Lead deletion if the status is Working Contacted 
//LeadTrigger 

trigger LeadTrigger on Lead (before delete) {

  if(Trigger.isDelete && Trigger.isBefore){
    LeadTriggerHandler.handleActivitiesBeforeDelete(Trigger.OLD);
  }
}

//LeadTriggerHandler 
public class LeadTriggerHandler {
 public static void handleActiviesBeforeDelete(List<Lead> leadRecords){
  for(Lead leadRec:leadRecords){
    if(leadRec.status=='Working Contacted'){
       leadRec.addError('You Dont have permision to Delete this Records');
