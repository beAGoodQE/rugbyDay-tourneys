trigger ContactTrigger on Contact (after insert) {

    if(Trigger.isInsert) {

        if(Trigger.isBefore) {
            // Placeholder for future 'before insert' work
        }

        if(Trigger.isAfter) {
            List<Opportunity> opps = new List<Opportunity>();

            for (Contact con : Trigger.New) {

                Opportunity opp = new Opportunity();
                opp.ContactId = con.Id;
                opp.Name = 'Test Run';
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today().addDays(30);
                opps.add(opp);
            }

            if (!opps.isEmpty()) {
                try{
                    insert opps;
                } catch (DMLException e) {
                    // TODO: Add some better handling
                    System.debug(e);
                }
            }
        }
    }

}