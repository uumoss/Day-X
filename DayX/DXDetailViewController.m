//
//  DXDetailViewController.m
//  DayX
//
//  Created by wes mb on 9/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXDetailViewController.h"

static NSString * const entryKey = @"entry";
static NSString * const titleKey = @"title";
static NSString * const textKey = @"text";

@interface DXDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@end

@implementation DXDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)updateWithDictionary:(NSDictionary *)dictionary {
    self.textField.text = dictionary[titleKey];
    self.textView.text = dictionary[textKey];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Day-X";
    
    self.textView.delegate = self;
    self.textField.delegate = self;
    
    NSDictionary *entry = [[NSUserDefaults standardUserDefaults] objectForKey:entryKey];
    [self updateWithDictionary:entry];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

- (IBAction)clearButtonPressed:(id)sender {
    self.textView.text = @"";
    self.textField.text = @"";
}

- (IBAction)save:(id)sender{
    NSDictionary *entry = @{titleKey: self.textField.text, textKey: self.textView.text};
    [[NSUserDefaults standardUserDefaults] setObject:entry forKey:entryKey];
    NSLog(@"Save");

}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self save:textField];
    
}

-(void)textViewDidChange:(UITextView *)textView {
    [self save:textView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
