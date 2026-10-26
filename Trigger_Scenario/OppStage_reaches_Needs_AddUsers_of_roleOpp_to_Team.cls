// As soon as Opportunity Stage reaches Needs Analysis, add all users of role Opportunists to the Team

trigger OpportunityTrigger on Opportunity (before insert, after delete, after update){
    if (Trigger.isUpdate && Trigger.isAfter){
    OpportunityTriggerHandler
    }
}
