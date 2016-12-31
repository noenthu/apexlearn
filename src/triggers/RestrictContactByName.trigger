trigger RestrictContactByName on Contact (before insert, before update) {
    RestrictContactByNameHandler handler = RestrictContactByNameHandler.getHandler();
    if (Trigger.isInsert) {
        handler.beforeInsert();
    }
    if (Trigger.isUpdate) {
        handler.beforeUpdate();
    //    for(Contact c : Trigger.New) {
    //        if(c.LastName == 'INVALIDNAME') {
    //            c.AddError('The Last Name "' +c.LastName+ '" is not allowed for DML');
    //        }
    //    }
    }
    if (Trigger.isDelete) {
        //handler.beforeDelete();
    }
}