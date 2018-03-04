//
//  ViewController.h
//  RBNSThreadDemo
//
//  Created by pranav on 03/03/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) NSThread *backThread;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)countingToggle:(UIButton*)sender;
- (IBAction)threadStatus:(UIButton*)sender;

@end

