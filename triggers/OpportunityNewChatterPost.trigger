trigger OpportunityNewChatterPost on Opportunity (after insert) {

    User user = [select id from User where id = :UserInfo.getUserId()];

    Opportunity oppId = Trigger.New[0];

    //Adding a Text post
    FeedItem post = new FeedItem();
    post.ParentId = user.id; //eg. Opportunity id, custom object id..
    post.Body = 'test from trigger opportunityNewChatterPost';
    post.LinkURL = 'https://na17.salesforce.com/' + oppId.Id;
    insert post;
}