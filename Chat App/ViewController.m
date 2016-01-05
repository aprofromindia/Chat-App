//
//  ViewController.m
//  Chat App
//
//  Created by Apro on 17/12/15.
//  Copyright © 2015 Apro. All rights reserved.
//

#import "ViewController.h"
#import "ResponseModel.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "Constants.h"
#import "LinkModel.h"

@interface ViewController (){
    __weak IBOutlet UILabel *_outputLabel;
    __weak IBOutlet UITextField *_inputField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _inputField.text = @"@tom @john likes (coffee) and http://twitter.com";
    
    ResponseModel *response = [[ResponseModel alloc] initWithString:_inputField.text];
    
    [response toJSONDict:^(NSDictionary *dict) {
        NSError *err;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&err];
        
        if (err) {
            DDLogError(@"%@", err.description);
        }else{
            _outputLabel.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
