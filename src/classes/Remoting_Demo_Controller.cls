global class Remoting_Demo_Controller {
    public Remoting_Demo_Controller() {

    }

    @RemoteAction
    global static Account[] getAccounts() {
        Account[] accounts = new Account[]{};

        accounts = [SELECT Id, Name FROM Account ORDER BY Name LIMIT 5];

        return accounts;
    }



    @RemoteAction
    global static Map<String, Integer> getInfo() {
        /*limits = ['DMLStatements', 'AggregateQueries', 'AsyncCalls',
               'CallOuts', 'CpuTime', 'DMLRows', 'EmailInvications',
               'FutureCalls', 'HeapSize', 'MobilePushApexCalls',
               'Queries', 'QueryLocatorRows', 'QueryRows', 'QueueableJobs'];*/

        Map<String, Integer> myLimits      = new Map<String, Integer>();

        myLimits.put('DMLStatements', Limits.getDMLStatements());
        myLimits.put('LimitDMLStatements', Limits.getLimitDMLStatements());
        myLimits.put('AggregateQueries', Limits.getAggregateQueries());
        myLimits.put('LimitAggregateQueries', Limits.getLimitAggregateQueries());
        myLimits.put('AsyncCalls', Limits.getAsyncCalls());
        myLimits.put('LimitAsyncCalls', Limits.getLimitAsyncCalls());
        myLimits.put('CallOuts', Limits.getCallOuts());
        myLimits.put('LimitCallOuts', Limits.getLimitCallOuts());
        myLimits.put('CpuTime', Limits.getCpuTime());
        myLimits.put('LimitCpuTime', Limits.getLimitCpuTime());
        myLimits.put('DMLRows', Limits.getDMLRows());
        myLimits.put('LimitDMLRows', Limits.getLimitDMLRows());
        myLimits.put('EmailInvocations', Limits.getEmailInvocations());
        myLimits.put('LimitEmailInvocations', Limits.getLimitEmailInvocations());
        myLimits.put('FutureCalls', Limits.getFutureCalls());
        myLimits.put('LimitFutureCalls', Limits.getLimitFutureCalls());
        myLimits.put('HeapSize', Limits.getHeapSize());
        myLimits.put('LimitHeapSize', Limits.getLimitHeapSize());
        myLimits.put('MobilePushApexCalls', Limits.getMobilePushApexCalls());
        myLimits.put('LimitMobilePushApexCalls', Limits.getLimitMobilePushApexCalls());
        myLimits.put('Queries', Limits.getQueries());
        myLimits.put('LimitQueries', Limits.getLimitQueries());
        myLimits.put('QueryLocatorRows', Limits.getQueryLocatorRows());
        myLimits.put('LimitQueryLocatorRows', Limits.getLimitQueryLocatorRows());
        myLimits.put('QueryRows', Limits.getQueryRows());
        myLimits.put('LimitQueryRows', Limits.getLimitQueryRows());
        myLimits.put('QueueableJobs', Limits.getQueueableJobs());
        myLimits.put('LimitQueueableJobs', Limits.getLimitQueueableJobs());

        /*Integer myDMLStatements            = Limits.getDMLStatements();
        Integer myLimitDMLStatements       = Limits.getLimitDMLStatements();
        Integer myAggQueries               = Limits.getAggregateQueries();
        Integer myLimitAggQueries          = Limits.getLimitAggregateQueries();
        Integer myAsyncCalls               = Limits.getAsyncCalls();
        Integer myLimitAsyncCalls          = Limits.getLimitAsyncCalls();
        Integer myCallouts                 = Limits.getCallOuts();
        Integer myLimitCallouts            = Limits.getLimitCallOuts();
        Integer myCpuTime                  = Limits.getCpuTime();
        Integer myLimitCpuTime             = Limits.getLimitCpuTime();
        Integer myDMLRows                  = Limits.getDMLRows();
        Integer myLimitDMLRows             = Limits.getLimitDMLRows();
        Integer myEmailInvocations         = Limits.getEmailInvocations();
        Integer myLimitEmailInvocations    = Limits.getLimitEmailInvocations();
        Integer myFutureCalls              = Limits.getFutureCalls();
        Integer myLimitFutureCalls         = Limits.getLimitFutureCalls();
        Integer myHeapSize                 = Limits.getHeapSize();
        Integer myLimitHeapSize            = Limits.getLimitHeapSize();
        Integer myMobilePushApexCalls      = Limits.getMobilePushApexCalls();
        Integer myLimitMobilePushApexCalls = Limits.getLimitMobilePushApexCalls();
        Integer myQueries                  = Limits.getQueries();
        Integer myLimitQueries             = Limits.getLimitQueries();
        Integer myQueryLocatorRows         = Limits.getQueryLocatorRows();
        Integer myLimitQueryLocatorRows    = Limits.getLimitQueryLocatorRows();
        Integer myQueryRows                = Limits.getQueryRows();
        Integer myLimitQueryRows           = Limits.getLimitQueryRows();
        Integer myQueueableJobs            = Limits.getQueueableJobs();
        Integer myLimitQueueableJobs       = Limits.getLimitQueueableJobs();

        myLimits.put('DMLStatements', myDMLStatements);
        myLimits.put('LimitDMLStatements', myLimitDMLStatements);
        myLimits.put('AsyncCalls', myAsyncCalls);
        myLimits.put('LimitAsyncCalls', myLimitAsyncCalls);*/
        return myLimits;
    }


    class RemotingDemoException extends Exception {}
}