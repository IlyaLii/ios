//
//  IR_controler.m
//  RSSchool_T4
//
//  Created by user on 21/04/2019.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import "IR_controler.h"
@interface IR_controler () <UITextFieldDelegate>

@end
@implementation IR_controler
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITextField *phone_number = [[UITextField alloc] initWithFrame:CGRectMake(15, 200, 385, 40)];
    phone_number.backgroundColor = [UIColor grayColor];
    phone_number.layer.cornerRadius = 15.f;
    phone_number.keyboardType = UIKeyboardTypePhonePad;
    phone_number.tag = 1;
    phone_number.delegate = self;
    phone_number.textAlignment = NSTextAlignmentCenter;
    [phone_number addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:phone_number];
    [phone_number release];
    
    UIImageView *flag = [[UIImageView alloc] initWithFrame:CGRectMake(15, 200, 40, 40)];
    flag.layer.borderColor = [UIColor blackColor].CGColor;
    flag.layer.cornerRadius = 15.0f;
    flag.tag = 2;
    [self.view addSubview:flag];
    [flag release];
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
    int backSpace = strcmp(_char, "\b");
    
    if (range.location == 0 && ![string isEqualToString:@"+"]) {
        textField.text = @"+";
    }
    int max = 12;
   
    if ([textField.text containsString:@"+375"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+374"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 16) {
            return NO;
        }
        
    }
    else if ([textField.text containsString:@"+373"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 16) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+380"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+992"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+994"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+993"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 16) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+996"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+998"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 18) {
            return NO;
        }
    }
    else if ([textField.text containsString:@"+7"]) {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 17) {
            return NO;
        }
    }
    else {
        if (backSpace == -8) {
            return YES;
        }
        else if ([textField.text length] > 12) {
            return NO;
        }
    }
    
    return YES;
}
-(NSString *) formatFor8Numbers:(NSString *)text{
    NSMutableArray *arr = [NSMutableArray new];
    NSUInteger n = 0, i = 0, j = 0;
    NSMutableString *format = [NSMutableString stringWithFormat:@"+*** (**) ***-***"];
    for (int i = 1; i < [text length]; i++) {
        if (![@"() -+*#;," containsString:[text substringWithRange:NSMakeRange(i, 1)]]) {
            [arr addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    n = [arr count];
    while (n!=0) {
        if ([[format substringWithRange:NSMakeRange(i, 1)] isEqualToString: @"*"]) {
            n--;
            [format deleteCharactersInRange:NSMakeRange(i, 1)];
            [format insertString:[arr objectAtIndex:j] atIndex:i];
            j++;
            
        }
        i++;
    }
    return [format substringWithRange:NSMakeRange(0, i)];

}

-(NSString *)formatFor9Numbers:(NSString *)text
{
    NSMutableArray *arr = [NSMutableArray new];
    NSUInteger n = 0, i = 0, j = 0;
    NSMutableString *format = [NSMutableString stringWithFormat:@"+*** (**) ***-**-**"];
    for (int i = 1; i < [text length]; i++) {
        if (![@"() -+*#;," containsString:[text substringWithRange:NSMakeRange(i, 1)]]) {
            [arr addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    n = [arr count];
    while (n!=0) {
        if ([[format substringWithRange:NSMakeRange(i, 1)] isEqualToString: @"*"]) {
            n--;
            [format deleteCharactersInRange:NSMakeRange(i, 1)];
            [format insertString:[arr objectAtIndex:j] atIndex:i];
            j++;
            
        }
        i++;
    }
    return [format substringWithRange:NSMakeRange(0, i)];

}

-(NSString *)formatFor10Numbers:(NSString *)text
{
    NSMutableArray *arr = [NSMutableArray new];
    NSUInteger n = 0, i = 0, j = 0;
    NSMutableString *format = [NSMutableString stringWithFormat:@"+* (***) *** ** **"];
    for (int i = 1; i < [text length]; i++) {
        if (![@"() -+*#;," containsString:[text substringWithRange:NSMakeRange(i, 1)]]) {
            [arr addObject:[text substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    n = [arr count];
    while (n!=0) {
        if ([[format substringWithRange:NSMakeRange(i, 1)] isEqualToString: @"*"]) {
            n--;
            [format deleteCharactersInRange:NSMakeRange(i, 1)];
            [format insertString:[arr objectAtIndex:j] atIndex:i];
            j++;
            
        }
        i++;
    }
    return [format substringWithRange:NSMakeRange(0, i)];

}

- (void)textFieldDidChange:(UITextField *)textField {
    
   
    UIImageView *flag = [self.view viewWithTag:2];
    
    if ([textField.text containsString:@"+375"]) {
        flag.image = [UIImage imageNamed:@"flag_BY"];
        textField.text = [self formatFor9Numbers: textField.text];
    }
    else if ([textField.text containsString:@"+374"]) {
        flag.image = [UIImage imageNamed:@"flag_AM"];
        textField.text = [self formatFor8Numbers: textField.text];
    }
    else if ([textField.text containsString:@"+373"]) {
        flag.image = [UIImage imageNamed:@"flag_MD"];
        textField.text = [self formatFor8Numbers: textField.text];
    }
    else if ([textField.text containsString:@"+380"]) {
        flag.image = [UIImage imageNamed:@"flag_UA"];
        textField.text = [self formatFor9Numbers: textField.text];
        
    }
    else if ([textField.text containsString:@"+992"]) {
        flag.image = [UIImage imageNamed:@"flag_TJ"];
        textField.text = [self formatFor9Numbers: textField.text];
        
    }
    else if ([textField.text containsString:@"+994"]) {
        flag.image = [UIImage imageNamed:@"flag_AZ"];
        textField.text = [self formatFor9Numbers: textField.text];
        
    }
    else if ([textField.text containsString:@"+993"]) {
        flag.image = [UIImage imageNamed:@"flag_TM"];
        textField.text = [self formatFor8Numbers: textField.text];
        
    }
    else if ([textField.text containsString:@"+996"]) {
        flag.image = [UIImage imageNamed:@"flag_KG"];
        textField.text = [self formatFor9Numbers: textField.text];
        
    }
    else if ([textField.text containsString:@"+998"]) {
        flag.image = [UIImage imageNamed:@"flag_UZ"];
        textField.text = [self formatFor9Numbers: textField.text];
    }
    else if ([textField.text containsString:@"+77"] || [textField.text containsString:@"+7 (7"]) {
        flag.image = [UIImage imageNamed:@"flag_KZ"];
        textField.text = [self formatFor10Numbers: textField.text];
    }
    else if ([textField.text containsString:@"+7"]) {
        flag.image = [UIImage imageNamed:@"flag_RU"];
        textField.text = [self formatFor10Numbers: textField.text];
    }

    else{
        flag.image = nil;
    }

}
@end
