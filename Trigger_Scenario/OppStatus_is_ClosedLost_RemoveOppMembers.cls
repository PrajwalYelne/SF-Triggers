//As soon as Opportunity is Closed Lost, remove all Opportunity Team Members from the Opportunity 

trigger OpportunityTrigger on Opportunity (before insert, after delete, after update){
  if(Trigger.isUpdate && Trigger.isAfter){
    OpportunityTriggerHandler.handleActivtiesAfterUpdate(Trigger.New);
  }
}

   public class OpportunityTriggerHandler {
    public static void handleActivitiesAfterUpdate(List<Opportunity> newRecords){
        List<Id> listofOppIds = new List<Id>();
        List<OpportunityTeamMember> deleteMemberList = new List<OpportunityTeamMember>();
        for(opportunity opp : newRecords){
            listofOppIds.add(opp.Id);
        }
        List<OpportunityTeamMember> teamMembers = [SELECT id, OpportunityId FROM OpportunityTeamMember WHERE OpportunityId IN : listofOppIds]; 
        
        for(Opportunity opp : newRecords){
            if(opp.StageName == 'Close Lost'){
                for(OpportunityTeamMember teamMember : teamMembers){
                    if(teamMember.OpportunityId == opp.Id){
                        deleteMemberList.add(teamMember);
                    }
                }
            }
        }
        
        if(!deleteMemberList.isEmpty()){
            delete deleteMemberList;
        }
    }
}
