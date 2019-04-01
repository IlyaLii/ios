#import "RomanTranslator.h"

@implementation RomanTranslator
- (NSString *)romanFromArabic:(NSString *)arabicString{
    NSArray *key = [NSArray arrayWithObjects:@"I",@"IV",@"V",@"IX",@"X",@"XL",@"L",@"XC",@"C",@"CD",@"D",@"CM",@"M", nil];
    NSArray *numbers = [NSArray arrayWithObjects:@(1),@(4),@(5),@(9),@(10),@(40),@(50),@(90),@(100),@(400),@(500),@(900),@(1000), nil];
    //NSDictionary *dict = [NSDictionary dictionaryWithObjects:numbers forKeys:key];
    int number = [arabicString intValue], i=12, j = 0;
    NSMutableString *answer = [[NSMutableString new] autorelease];
    while (number>0) {
        if (number-[[numbers objectAtIndex:i] intValue] >= 0) {
            [answer insertString:[key objectAtIndex:i] atIndex:j];
            
            
            number-=[[numbers objectAtIndex:i] intValue];
            if (i%2!=0) {
                j+=2;
            }
            else{
                j++;
            }
        }
        else{
            i--;
        }
    }
 
    return answer;
}

- (NSString *)arabicFromRoman:(NSString *)romanString{
    NSArray *key = [NSArray arrayWithObjects:@"I",@"IV",@"V",@"IX",@"X",@"XL",@"L",@"XC",@"C",@"CD",@"D",@"CM",@"M", nil];
    NSArray *numbers = [NSArray arrayWithObjects:@(1),@(4),@(5),@(9),@(10),@(40),@(50),@(90),@(100),@(400),@(500),@(900),@(1000), nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:numbers forKeys:key];
    NSUInteger arabic = 0;
    int j = [romanString length]-1, temp=0;
    for(int i = 0; i<[romanString length]; i++, j--) {
        if (temp>[[dict objectForKey:[romanString substringWithRange:NSMakeRange(j, 1)]] intValue]) {
            arabic-=[[dict objectForKey:[romanString substringWithRange:NSMakeRange(j, 1)]] intValue];
        }
        else
        {
         arabic+=[[dict objectForKey:[romanString substringWithRange:NSMakeRange(j, 1)]] intValue];
        }
        temp=[[dict objectForKey:[romanString substringWithRange:NSMakeRange(j, 1)]] intValue];
    }
    NSString *answer = [NSString stringWithFormat:@"%d",arabic];
    return answer;
}
@end
