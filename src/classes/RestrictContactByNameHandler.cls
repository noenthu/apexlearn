/**
 *	@author: Vivek Chowdhary
 *	@date: 2016-12-30 08:44:15 PM 
 *	@description:
 *	    Trigger Handler for RestrictContactByName Trigger
 *	
 *	Version History :   
 *		
 */
public without sharing class RestrictContactByNameHandler {
    private static RestrictContactByNameHandler handler;
    
    public static RestrictContactByNameHandler getHandler() {
        if (null == handler) {
            handler = new RestrictContactByNameHandler();
        }
        return handler;
    }
    
    public void beforeInsert () {
        for (Contact c : (List<Contact>) Trigger.new) {
            if(c.LastName == 'INVALIDNAME') {
                c.AddError('The Last Name "' +c.LastName+ '" is not allowed for DML');
            }
        }
    }
    
    public void beforeUpdate () {
        for (Contact c : (List<Contact>) Trigger.new) {
            if(c.LastName == 'INVALIDNAME') {
                c.AddError('The Last Name "' +c.LastName+ '" is not allowed for DML');
            }
        }
    }
    
    //public void beforeDelete () {
    //    // nothing currently
    //}
    
    //public void afterInsert () {
    //    // nothing currently
    //}
    
    //public void afterUpdate () {
    //    // nothing currently
    //}

    //public void afterDelete () {
    //    // nothing currently
    //}
    
    //public void afterUnDelete () {
    //    // nothing currently
    //}
}