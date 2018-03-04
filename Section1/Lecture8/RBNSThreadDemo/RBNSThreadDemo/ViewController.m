//
//  ViewController.m
//  RBNSThreadDemo
//
//  Created by pranav on 03/03/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize backThread;
@synthesize outputLabel;

-(NSThread*)backThread {
    if (!backThread) {
        backThread = [[NSThread alloc] initWithTarget:self selector:@selector(longLoop) object:nil];
    }
    return backThread;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)longLoop {
    for (long i = 0; YES; i++) {
        [self performSelectorOnMainThread:@selector(updateOutputLabel:) withObject:[NSNumber numberWithLong:i] waitUntilDone:NO];
        sleep(1);
        
        if ([backThread isCancelled]) {
            backThread = nil;
            break;
        }
    }
}

-(void)updateOutputLabel:(NSNumber*)number {
    outputLabel.text = [NSString stringWithFormat:@"%ld",[number longValue]];
}

- (IBAction)countingToggle:(UIButton*)sender {
    if ([self.backThread isExecuting]) {
        [sender setTitle:@"Start Counting" forState:UIControlStateNormal];
        [self.backThread cancel];
    } else {
        [sender setTitle:@"Stop Counting" forState:UIControlStateNormal];
        [self.backThread start];
    }

//    for (long i = 0; YES; i++) {
//        outputLabel.text = [NSString stringWithFormat:@"%ld",i];
//        NSLog(@"--------------------------------------------------------------");
//        if (i == 10) {
//            NSLog(@"Set needs display will be called and as we are equal to 10 we break the loop and then we have a chance to update ui");
//            break;
//        } else {
//            NSLog(@"Set needs display will be called but there is no chance to update UI yet as we have not reached 10");
//        }
//        sleep(1);
//    }
    
}

- (IBAction)threadStatus:(id)sender {
    if ([self.backThread isExecuting]) {
        NSLog(@"Thread is executing");
    } else {
        NSLog(@"Thread is not executing");
    }
}
@end
