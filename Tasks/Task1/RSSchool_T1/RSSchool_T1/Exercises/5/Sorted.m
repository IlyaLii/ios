#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    NSMutableArray *divided = [NSMutableArray new];
    divided = [string componentsSeparatedByString:@" "];
    bool flag = true;
    int temp = [divided[0] intValue], pos_nach, pos_end, revers = 0;
    for (int i = 1; i < [divided count]; i++) {
        if (temp>[divided[i] intValue] && flag) {
            pos_nach=i-1;
            revers++;
            flag = false;
            pos_end=i;
        }
        else if(!flag && temp>=[divided[i] intValue])
        {
            revers++;
            pos_end=i;
        }
        temp = [divided[i] intValue];
    }
    
    if ((pos_nach+revers==pos_end) && revers>2)
    {
        //NSLog(@"%d", revers);
        //NSLog();
        for (int i = pos_nach; i<revers; i++) {
           // if (pos_end-i==i) {
             ///   pos_end++;
            //}
            [divided exchangeObjectAtIndex:i
                         withObjectAtIndex:pos_end-i+1];
        }
        temp = [divided[0] intValue];
        for (int i = 1; i< [divided count]; i++) {
            if (temp>[divided[i] intValue]) {
                return 0;
            }
            temp = [divided[i] intValue];
        }
        value.status = YES;
        NSString* otvet = [NSString stringWithFormat:@"reverse %d %d", pos_nach + 1, pos_nach + revers+1];
        value.detail=otvet;
        [otvet release];
        
    }
    else if(revers!=0)
    {
        [divided exchangeObjectAtIndex:pos_nach
                     withObjectAtIndex:pos_end];
        temp = [divided[0] intValue];
        for (int i = 1; i< [divided count]; i++) {
            if (temp>[divided[i] intValue]) {
                return 0;
            }
            temp = [divided[i] intValue];
        }
     
       NSString* otvet = [NSString stringWithFormat:@"swap %d %d", pos_nach + 1, pos_end + 1];
        value.detail = otvet;
        value.status = YES;
        [otvet release];
    }
    else
    {
        value.status = YES;
    }
    return value;
}

@end
