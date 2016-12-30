public with sharing class SpeakerControllerExtension {

	public blob picture { get; set; }
	public String errorMessage { get; set; }
	private final Speaker__c speaker;
	private ApexPages.StandardController stdController;

    // The extension constructor initializes the private member
    // variable mysObject by using the getRecord method from the standard
    // controller.
    public SpeakerControllerExtension(ApexPages.StandardController stdController) {
        this.speaker = (Speaker__c)stdController.getRecord();
    }

    public String getRecordName() {
        return 'Hello ' + (String)speaker.get('name') + ' (' + (Id)speaker.get('Id') + ')';
    }

		public PageReference save() {
			errorMessage = '';
			try {
				upsert speaker;
				if (picture != null) {
					Attachment attachment = new Attachment();
					attachment.body = picture;
					attachment.name = 'speaker_' + speaker.id + '.jpg';
					attachment.parentid = speaker.id;
					attachment.ContentType = 'application/jpg';
					insert attachment;
					speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file=' + attachment.id;
					update speaker;
				}
				return new ApexPages.StandardController(speaker).view();

			} catch (System.Exception ex) {
				errorMessage = ex.getMessage();
				return null;
			}
		}
}