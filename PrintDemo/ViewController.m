//
//  ViewController.m
//  PrintDemo
//
//  Created by anhdn on 10/11/16.
//  Copyright © 2016 cauca. All rights reserved.
//

#import "ViewController.h"
#import "ESCPOSPrinter.h"

@interface ViewController ()<UIPrintInteractionControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@property (nonatomic, strong) ESCPOSPrinter *escp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)printButtonTapped:(id)sender {
    NSString * imgfile = [[NSBundle mainBundle] pathForResource:@"sample_6.jpg" ofType:nil];
    [self.escp printBitmap:imgfile withAlignment:ALIGNMENT_CENTER withSize:BITMAP_NORMAL withBrightness:1];
    [self.escp cutPaper];
}

- (IBAction)printText:(id)sender  {
    [self.escp printString:self.textField.text];
    [self.escp cutPaper];
}

- (IBAction)creatConnect:(id)sender {
    self.escp = [[ESCPOSPrinter alloc] init];
    NSString *ip = self.textField.text;
    [self.escp openPort:ip withPortParam:9100];
}
@end
