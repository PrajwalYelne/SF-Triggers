//Allow Case Deletion only by System Admin users

trigger CaseTrigger on Case(before delete){
  CaseTriggerHandler.handleActivitiesBeforeDelete(Trigger.old);
}

public cla
