// Every time an account website is updated, update the website field on all its child contacts 

//AccountTrigger 

trigger AccountTrigger on Account (before update, after update) { 

     

    if (Trigger.isAfter && Trigger.isUpdate){ 

     AccountTriggerHandler.handleAfterUpdateActivities(Trigger.New, Trigger.oldMap);    

    } 

} 
