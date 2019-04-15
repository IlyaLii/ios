#import "FullBinaryTrees.h"
@implementation FullBinaryTrees : NSObject
- (NSString *)stringForNodeCount:(NSInteger)count{
    if (count % 2 == 0) {
        return @"[]";
    }
    NSMutableDictionary *dict = [NSMutableDictionary new];
    NSMutableString *str = [NSMutableString stringWithFormat:@"[[0]]"];
    count--;
    
    int n = 2;
    while (count!=0) {
        count-=2;
    }
    
    
    
    
    
    
    
    return  str;
}
@end
