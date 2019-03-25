#import "SummArray.h"

@implementation SummArray
// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *n in array) {
        sum+=[n intValue];
        [n release];
    }
    return @(sum);
}

@end
