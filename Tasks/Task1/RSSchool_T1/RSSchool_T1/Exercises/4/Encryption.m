#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSMutableString *)encryption:(NSString *)string {
    NSMutableString *new_str = [[NSMutableString new] autorelease];
    int row = floor(sqrt([string length]));
    int columns = ceil(sqrt([string length]));
    if (row*columns<[string length]) {
        row++;
    }
    int k = 0, n = 0;
    bool flag = false;
    for (int i = 0, i1 = 0; i1<[string length]; i+=columns, i1++) {
        if (flag) {
            i = k;
            flag = false;
        }
       // NSLog(@"%@",[string substringWithRange: NSMakeRange(i, 1)]);
        [new_str insertString: [string substringWithRange: NSMakeRange(i, 1)] atIndex: i1+k];
        n++;
        if ((((i1+1) % row == 0 && i1!=0 && n+1>=columns) || (i+columns >= [string length])) && n!=1 && i1+1!=[string length]) {
            n = 0;
            k++;
            [new_str insertString:@" " atIndex:i1+k];
            flag = true;
        }
    }
    
    return (new_str);
}

@end
