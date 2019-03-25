#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    int sum = 0;
    NSArray *divided = [NSArray new];
    for (int i = 0; i<[array count]; i++) {
        divided = [array[i] componentsSeparatedByString:@" "];
        sum+=[divided[i] intValue];
        sum-=[divided[[array count]-1-i] intValue];
        
    }

    return @(abs(sum));
}

@end
