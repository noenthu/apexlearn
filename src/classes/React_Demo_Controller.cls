global class React_Demo_Controller {
    public React_Demo_Controller() {

    }

    @RemoteAction
    global static Account[] getAccounts() {
        Account[] accounts = new Account[]{};

        accounts = [SELECT Id, Name FROM Account ORDER BY Name LIMIT 5];

        return accounts;
    }

    public class LimitWrapper {
        String limitName;
        Integer usedLimit;
        Integer availableLimit;

        public LimitWrapper(String limitName, Integer usedLimit, Integer availableLimit) {
            this.limitName = limitName;
            this.usedLimit = usedLimit;
            this.availableLimit = availableLimit;
        }
    }

    private static final List<String> apexLimits = new List<String>{
        'DMLStatements', 'AggregateQueries', 'AsyncCalls', 'CallOuts',
            'CpuTime', 'DMLRows', 'EmailInvocations',
            'FutureCalls', 'HeapSize', 'MobilePushApexCalls',
            'Queries', 'QueryLocatorRows', 'QueryRows', 'QueueableJobs'};


    @RemoteAction
    //global static Map<String, Integer> getInfo() {
    public static List<LimitWrapper> getInfo() {
        //Map<String, Integer> myLimitsMap      = new Map<String, Integer>();

        List<LimitWrapper> myLimits = new List<LimitWrapper>{};

        for (String apexLimit : apexLimits) {
            if (apexLimit == 'DMLStatements') {
                myLimits.add(new LimitWrapper('DMLStatements', 
                            Limits.getDMLStatements(),
                            Limits.getLimitDMLStatements()));
            } else if (apexLimit == 'AggregateQueries') {
                myLimits.add(new LimitWrapper('AggregateQueries', 
                            Limits.getAggregateQueries(),
                            Limits.getLimitAggregateQueries()));
            } else if (apexLimit == 'AsyncCalls') {
                myLimits.add(new LimitWrapper('AsyncCalls', 
                            Limits.getAsyncCalls(),
                            Limits.getLimitAsyncCalls()));
            } else if (apexLimit == 'CallOuts') {
                myLimits.add(new LimitWrapper('CallOuts', 
                            Limits.getCallOuts(),
                            Limits.getLimitCallOuts()));
            } else if (apexLimit == 'CpuTime') {
                myLimits.add(new LimitWrapper('CpuTime', 
                            Limits.getCpuTime(),
                            Limits.getLimitCpuTime()));
            } else if (apexLimit == 'DMLRows') {
                myLimits.add(new LimitWrapper('DMLRows', 
                            Limits.getDMLRows(),
                            Limits.getLimitDMLRows()));
            } else if (apexLimit == 'EmailInvocations') {
                myLimits.add(new LimitWrapper('EmailInvocations', 
                            Limits.getEmailInvocations(),
                            Limits.getLimitEmailInvocations()));
            } else if (apexLimit == 'FutureCalls') {
                myLimits.add(new LimitWrapper('FutureCalls', 
                            Limits.getFutureCalls(),
                            Limits.getLimitFutureCalls()));
            } else if (apexLimit == 'HeapSize') {
                myLimits.add(new LimitWrapper('HeapSize', 
                            Limits.getHeapSize(),
                            Limits.getLimitHeapSize()));
            } else if (apexLimit == 'MobilePushApexCalls') {
                myLimits.add(new LimitWrapper('MobilePushApexCalls', 
                            Limits.getMobilePushApexCalls(),
                            Limits.getLimitMobilePushApexCalls()));
            } else if (apexLimit == 'Queries') {
                myLimits.add(new LimitWrapper('Queries', 
                            Limits.getQueries(),
                            Limits.getLimitQueries()));
            } else if (apexLimit == 'QueryLocatorRows') {
                myLimits.add(new LimitWrapper('QueryLocatorRows', 
                            Limits.getQueryLocatorRows(),
                            Limits.getLimitQueryLocatorRows()));
            } else if (apexLimit == 'QueryRows') {
                myLimits.add(new LimitWrapper('QueryRows', 
                            Limits.getQueryRows(),
                            Limits.getLimitQueryRows()));
            } else if (apexLimit == 'QueueableJobs') {
                myLimits.add(new LimitWrapper('QueueableJobs', 
                            Limits.getQueueableJobs(),
                            Limits.getLimitQueueableJobs()));
            } else {
                System.debug('this cannot be');
            }
        }

        return myLimits;
    }


    class RemotingDemoException extends Exception {}
}