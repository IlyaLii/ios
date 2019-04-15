#import "DateMachine.h"
#import "AppDelegate.h"
@interface DateMachine () <UITextFieldDelegate>
@end



@implementation DateMachine

- (void)viewDidLoad {
  [super viewDidLoad];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:curDate];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 400, 400)];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"" size:15];
    label.text = dateString;
    label.tag = 1;
    [self.view addSubview:label];
    
    
    UIButton *button_add = [[UIButton alloc] initWithFrame:CGRectMake(210, 500, 200, 200)];
    button_add.layer.borderColor = [UIColor blackColor].CGColor;
    button_add.layer.borderWidth = 1.f;
    button_add.layer.cornerRadius = 50;
    [button_add setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button_add.layer.backgroundColor = [UIColor cyanColor].CGColor;
    [button_add setTitle:@"Add" forState:UIControlStateNormal];
    [button_add addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button_add];
    
    
    UIButton *button_sub = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 200, 200)];
    button_sub.layer.borderColor = [UIColor blackColor].CGColor;
    [button_sub setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button_sub.layer.borderWidth = 1.f;
    button_sub.layer.cornerRadius = 50;
    button_sub.layer.backgroundColor = [UIColor cyanColor].CGColor;
    [button_sub setTitle:@"Sub" forState:UIControlStateNormal];
    [button_sub addTarget:self action:@selector(sub:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button_sub];
    
    
    UITextField *start = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    start.placeholder =@"Start date";
    start.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [start addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:start];
    start.tag = 2;
    start.delegate = self;
    
    UITextField *Add = [[UITextField alloc] initWithFrame:CGRectMake(50, 160, 100, 100)];
    Add.placeholder =@"Step";
    Add.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:Add];
    Add.tag = 3;
    Add.delegate = self;
    UITextField *dateUnit = [[UITextField alloc] initWithFrame:CGRectMake(50, 270, 100, 100)];
    dateUnit.placeholder =@"Date unit";
    dateUnit.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:dateUnit];
    dateUnit.tag = 4;
    dateUnit.delegate = self;
    

    
}

-(void)add:(id)sender{
    UILabel *lab = [self.view viewWithTag:1];
    UITextField *data = [self.view viewWithTag:4];
    UITextField *unit = [self.view viewWithTag:3];
    int number =[unit.text intValue];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSDate *my_date = [dateFormatter dateFromString:lab.text];
    NSCalendar *cal = [NSCalendar currentCalendar];
    if ([data.text isEqualToString: @"year"]) {
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitYear
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];

    }
    else if([data.text isEqualToString: @"month"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitMonth
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];

    }
    else if ([data.text isEqualToString: @"day"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitDay
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
    }
    else if ([data.text isEqualToString: @"hour"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitHour
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];

    }
    else if ([data.text isEqualToString: @"minute"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitMinute
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];

    }
    else if([data.text isEqualToString: @"week"]) {
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitWeekOfMonth
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text = [dateFormatter stringFromDate:new_date];
    }
    
}
- (void)textFieldDidChange:(UITextField *)textField {
    UILabel *lab = [self.view viewWithTag: 1];
    
    if( textField.tag == 2) {
        
        lab.text = textField.text;
    }
}
-(void)sub:(id)sender{
    UILabel *lab = [self.view viewWithTag:1];
    UITextField *data = [self.view viewWithTag:4];
    UITextField *unit = [self.view viewWithTag:3];
    int number =-[unit.text intValue];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSDate *my_date = [dateFormatter dateFromString:lab.text];
    NSCalendar *cal = [NSCalendar currentCalendar];
    if ([data.text isEqualToString: @"year"]) {
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitYear
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
        
    }
    else if([data.text isEqualToString: @"month"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitMonth
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
        
    }
    else if ([data.text isEqualToString: @"day"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitDay
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
    }
    else if ([data.text isEqualToString: @"hour"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitHour
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
        
    }
    else if ([data.text isEqualToString: @"minute"]){
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitMinute
                                           value:number
                                          toDate:my_date
                                         options:0];
        lab.text=[dateFormatter stringFromDate:new_date];
        
    }
    else if([data.text isEqualToString: @"week"]) {
        NSDate *new_date = [cal dateByAddingUnit:NSCalendarUnitWeekOfMonth
                                               value:number
                                              toDate:my_date
                                             options:0];
        lab.text = [dateFormatter stringFromDate:new_date];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    UILabel *lab = [self.view viewWithTag:1];
    
    const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
    int isBackSpace = strcmp(_char, "\b");
    if (([@"01234567890" containsString: string] && textField.tag == 3) || isBackSpace == -8) {
        return YES;
    }
    else if (([@"yearmonthweekdayhourminute)" containsString:string] && textField.tag == 4) || isBackSpace == -8){
        return YES;
    }
    else if (textField.tag == 2){
        return YES;
    }
    return NO;
}
@end


