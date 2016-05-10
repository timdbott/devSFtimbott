trigger exampleTrigger on Contact (before insert) {

    if (Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        // call mail utility from another class
        EmailManager.sendMail('tbott@steelcase.com','Trailhead Trigger Tutorial', recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        // process after delete
    }
}