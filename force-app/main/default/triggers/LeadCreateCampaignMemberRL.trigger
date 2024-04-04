/**
 * Trigger that creates Campaign Member records when new Leads are inserted with a value in the 
 * Primary_Campaign_Source__c field.  Needed for converting the Lead to an Opportunity with Campaign
 */
trigger LeadCreateCampaignMemberRL on Lead (after insert) {

    
    /**
     * Creates Campaign Member records on the Primary_Campaign_Source__c field of newly inserted Leads
     * @param newLeads List of Lead records that have been inserted.
     */
    public static void createCampaignMember(List<Lead> newLeads) {
        List<CampaignMember> campaignMembers = new List<CampaignMember>();
        
        for (Lead lead : newLeads) {
            if (lead.Primary_Campaign_Source__c != null) {
                CampaignMember campaignMember = new CampaignMember();
                campaignMember.LeadId = lead.Id;
                campaignMember.CampaignId = lead.Primary_Campaign_Source__c;
                campaignMember.Status = 'Responded'; // You can set appropriate status here
                campaignMembers.add(campaignMember);
            }
        }
        
        if (!campaignMembers.isEmpty()) {
            try {
                insert campaignMembers;
            } catch (DmlException e) {
                System.debug('An error occurred while inserting Campaign Members: ' + e.getMessage());
                // Handle specific DML exceptions here, such as getting the failed records or error messages.
                for (Integer i = 0; i < e.getNumDml(); i++) {
                    System.debug('DML Exception for record ' + e.getDmlIndex(i) + ': ' + e.getDmlMessage(i));
                }
                // You can handle the exception here, such as logging it or sending an email notification.
            }
        }
    }
    
    if (Trigger.isAfter && Trigger.isInsert) {
        createCampaignMember(Trigger.new);
    }
}