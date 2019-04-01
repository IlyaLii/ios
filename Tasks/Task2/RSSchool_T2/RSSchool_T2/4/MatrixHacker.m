#import "MatrixHacker.h"
@interface MatrixHacker () <Character>
@property (copy) id<Character> (^block)(NSString *name);
@end
@implementation MatrixHacker

@synthesize block;

- (void)injectCode:(id<Character> (^)(NSString *name))theBlock
{
    self.block = theBlock;
}
- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names
{
    NSMutableArray *neo = [NSMutableArray new];
    for (NSString *name in names) {
        [neo addObject:self.block(name)];
    }
    return  neo;
}



@end
