#import "TinyURL.h"
@interface TinyURL()
@property int key;
@property NSURL *link;
@end

@implementation TinyURL
@synthesize key;
@synthesize link;

- (NSURL *)encode:(NSURL *)originalURL
{
    self.link = originalURL;
    self.key = arc4random()%10000;
    NSMutableString *encoded_string = [NSMutableString stringWithFormat:@"https://ir.cc/lk%dg",self.key];
    NSURL* encoded_Url = [NSURL URLWithString:encoded_string];
    return encoded_Url;
}

- (NSURL *)decode:(NSURL *)shortenedURL
{
    if ([shortenedURL.absoluteString containsString:[@(self.key) stringValue] ]) {
        return self.link;
    }
    return shortenedURL;
}
@end
