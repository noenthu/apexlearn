trigger ExampleTrigger on Contact (after insert, after delete) {
	if (Trigger.isInsert) {
		Integer recordCount = Trigger.New.size();
		// Call utility method from another class
		EmailManager.sendMail('giskarded@gmail.com', 'Trailhead trigger tutorial',
				recordCount + ' contact(s) were inserted');
	}
	else if (Trigger.isDelete) {
		// Process after delete
	}
}