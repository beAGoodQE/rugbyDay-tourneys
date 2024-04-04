@isTest
private class LeadCreateCampaignMemberRLTest {
    @isTest
    static void testCreateCampaignMember() {
        // Create a Campaign
        Campaign testCampaign = new Campaign(
            Name = 'Test Campaign'
        );
        insert testCampaign;
        
        // Create a Lead with a Primary Campaign Source
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Primary_Campaign_Source__c = testCampaign.Id
            // Add other required fields as necessary
        );
        insert testLead;
        
        // Trigger should have created a Campaign Member record
        List<CampaignMember> campaignMembers = [SELECT Id FROM CampaignMember WHERE LeadId = :testLead.Id];
        System.assertEquals(1, campaignMembers.size());
    }
}