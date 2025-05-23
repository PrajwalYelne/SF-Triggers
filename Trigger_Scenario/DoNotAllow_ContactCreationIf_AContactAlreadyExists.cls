// Do not allow contact creation if a contact already exists with the same last name, email & phone 

trigger ContactTrigger on Contact (before insert){

  if(Trigger.isBefore && Trigger.isInsert){
    ContactTriggerHandler.handleBeforeIncertActivities(Trigger.New);
  }
}


public class ContactTriggerHandler{

public static void handleBeforeIncert
