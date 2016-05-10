trigger ClosedOpportunityTrigger on Opportunity (after update, after insert) {

    List<Task> taskList = new List<Task>();
    
    for(Opportunity a : [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.New AND StageName = 'Closed Won']) {
        
        taskList.add(new Task(Subject='Follow Up Test Task',
                    WhatId = a.Id));
    }
    
    if(taskList.size() > 0) {
        
        insert taskList;
    }
}