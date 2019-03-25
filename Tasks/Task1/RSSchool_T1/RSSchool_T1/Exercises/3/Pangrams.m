#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    if ([string length] < 26) {
        return NO;
    }
    NSString *dictonary= @"qwertyuioplkjhgfdsazxcvbnm";
    string = [string lowercaseString];
    
    for (int i = 0; i< 26; i++) {
        if (![string containsString:[dictonary substringWithRange:NSMakeRange(i, 1)]]) {
            [dictonary release];
            return NO;
        }
    }
    [dictonary release];
    return YES;
}

@end
