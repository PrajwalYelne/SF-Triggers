//As soon as Opportunity is Closed Lost, remove all Opportunity Team Members from the Opportunity 

trigger OpportunityTrigger on Opportunity (before insert, after delete, after update){
  if(Trigger.isUpdate && Trigger.isAfter){
    OpportunityTriggerHandler.handleActivtiesAfterUpdate(Trigger.New);
  }
}

public class OpportunityTriggerHandler{
 public static void handleActivitiesAfterUpdate(List<Opportunity> newRecords){
    List<Id> listOfOppIds = new List<Id>();
    List<OpportunityTeamMember> deleteMemberList = new List<OpportunityTeamMember>();
   for(Opportunity opp: newRecords){
     listOfOppIds.add(opp.Id);
    }

 List <OpportunityTeamMember> teamMembers = [ Select Id, OpportunityId From OpportunityTeamMember 
                                              Where OpportunityId In: listOfOppIds];

  for(Oppoortunity opp: newRecords){
    if(opp.StageName == 'Close Lost'){
      for(OpportunityTeamMember teamMember : teamMembers ){
        if(teamMember.OpportunityId == opp.Id){
          deleteMemberList.add(teamMember);
        } 
      } 
    } 
 } 

if(!deleteMemberList.isEmpty){
    delete deleteM
