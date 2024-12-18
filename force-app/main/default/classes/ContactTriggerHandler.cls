public with sharing class ContactTriggerHandler {
    
    // When a contact is inserted
	// if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
	
	public static void setJsonId(List<Contact> newContact) {
        for (Contact cont : newContact) {
            if (cont.DummyJSON_Id__c == null) {
                cont.DummyJSON_Id__c = String.valueOf((Integer) (Math.random() * 101));
            }
        }
    }

    //When a contact is inserted
	// if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
    public static void startJsonCalloutGetUser(List<Contact> newContact){
        for (Contact cont : newContact){
            if (Integer.valueOf(cont.DummyJSON_Id__c) <= 100) {
                DummyJSONCallout.getDummyJSONUserFromId(cont.DummyJSON_Id__c);
            }
        }
    }

    //When a contact is updated
	// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
    public static void startJsonCalloutCreateUser(List<Contact> newContact){
        for (Contact cont : newContact) {
            if (Integer.valueOf(cont.DummyJSON_Id__c) > 100) {
                DummyJSONCallout.postCreateDummyJSONUser(cont.Id);
            }
        }
    }
}
    