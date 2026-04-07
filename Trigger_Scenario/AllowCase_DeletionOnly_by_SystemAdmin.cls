//Allow Case Deletion only by System Admin users

trigger CaseTrigger on Case(before delete){
  CaseTriggerHandler.handleActivitiesBeforeDelete(Trigger.old);
}

public class CaseTriggerHandler{
 public static void handleActivitesBeforeDelete(List<Case> oldRecord){
  Id currentUserProfileId = UserInfo.getProfileId();
  Id sysAdminProfileId = [Select Id, Name From Profile Where Nam
