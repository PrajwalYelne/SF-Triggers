//Share the contact record with a public group as soon as a record is created 
trigger contactTrigger on contact (before insert, after insert){
  if(Trigger.isAfter && Trigger.isInsert){
   ContactTriggerHandler.handleAfterIncertActivities(Trigger.New, Trigger.oldMap);
  }
}
