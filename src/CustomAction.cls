/* this is a custom action exmaple, you can use this action as a custom action under the edito layout and trigger it for spesific events e.g. OnAddRow / QX / ETC*/
public with sharing class CustomAction.cls implements zaapit.ZPTableHandler {
    public void doProcess(List<sobject> ll, map<string,object> params){ 
        system.debug('CustomAction.cls ');
        String event=params.get('event')+'';
        if('XQ'==event){
            if(params!=null && ll!=null && ll.size()>0 && ((account)ll[0]).name.indexOf('~')>-1){
                        system.debug('++++'+params.keySet());
            system.debug('event++++'+params.get('event'));
            system.debug('parentid++++'+params.get('parentid'));
            system.debug('page refferance++++'+params.get('page'));
            
                params.put('XQ',' createddate<TODAY');
                params.put('skipUpdate','1');
                ((account)ll[0]).name.addError('1'); 
                //params.put('skipInsert','1');
        }
        }else if('OnAddRow'==event){
            String parentid=params.get('parentid')+'';
            //Opportunity opp=[select id,Pricebook2Id from Opportunity where id=:parentid ];
            for(sobject op: ll){
                op.put('PricebookEntryId','01ud0000001YtP4AAK');
                op.put('UnitPrice',11);
                op.put('Quantity',5);
                
            }
        }
        
        
    }  
}