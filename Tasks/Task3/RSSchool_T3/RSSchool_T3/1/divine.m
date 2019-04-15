//
//  divine.m
//  RSSchool_T3
//
//  Created by user on 13/04/2019.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "divine.h"

@implementation divine
-(NSString *)get_str :(NSArray *) arr{
    
    NSMutableString *str = [NSMutableString stringWithFormat:@"["];
    for (int i = 0; i < [arr count]; i++) {
        if ([[arr objectAtIndex:i] isKindOfClass: [NSArray class]]) {
            str = [[str stringByAppendingString:[self get_str: [arr objectAtIndex:i]]] mutableCopy];
            str = [[str stringByAppendingString:@","] mutableCopy];
        }
        else if ([[arr objectAtIndex:i] isKindOfClass: [NSNumber class]])
        {
            str = [[str stringByAppendingString:[NSString stringWithFormat:@"%@,", [arr objectAtIndex:i]]] mutableCopy];
        }
        else if ([[arr objectAtIndex:i] isKindOfClass: [NSString class]])
        {
            str = [[str stringByAppendingString:[NSString stringWithFormat:@"\"%@\",", [arr objectAtIndex:i]]] mutableCopy];
        }
        else if ([[arr objectAtIndex:i] isKindOfClass: [NSNull class]]){
            str = [[str stringByAppendingString:@"null,"] mutableCopy];
        }
        else{
            str = [[str stringByAppendingString:@"unsupported,"] mutableCopy];
        }
        
    }
    str = [[str stringByAppendingString:@"]"] mutableCopy];
    str = [[str stringByReplacingOccurrencesOfString:@",," withString:@","] mutableCopy];
    str = [[str stringByReplacingOccurrencesOfString:@",]" withString:@"]"] mutableCopy];

   // NSLog(str);

    return [str autorelease];
}
@end
