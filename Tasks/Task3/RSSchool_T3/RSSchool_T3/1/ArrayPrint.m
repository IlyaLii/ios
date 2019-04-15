#import "ArrayPrint.h"
#import "divine.h"
@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print;{
    divine *str  = [divine new];
    return [str get_str:self];
}
@end
