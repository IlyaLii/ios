#import "KidnapperNote.h"

@implementation KidnapperNote
-(BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    
    NSMutableArray *value_arr = [[magazine lowercaseString] componentsSeparatedByString:@" "];
    NSArray *val_arr = [[note lowercaseString] componentsSeparatedByString:@" "];
    NSInteger count = [val_arr count];
    for (int i = 0; i< [val_arr count]; i++) {
        for (int j = 0; j < [value_arr count]; j++) {
            if ([val_arr[i] isEqualToString:value_arr[j]]) {
                count--;
                [value_arr removeObjectAtIndex:j];
                break;;
            }
        }
    }
    if (count == 0) {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end
