//
//  ViewController.m
//  IDFVMD5HashGenerator
//
//  Created by 麻生 拓弥 on 2017/04/14.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

#import "ViewController.h"
#import "HashUtility.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *idfvStrLabel;
@property (weak, nonatomic) IBOutlet UILabel *mdfiveHashedStrLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.idfvStrLabel.text = @"IDFV: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX";
    self.mdfiveHashedStrLabel.text = @"MD5Hash: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
}
- (IBAction)startAction:(id)sender {

    NSDictionary *dic = [HashUtility getHashedIDFVDic];

    self.idfvStrLabel.text = [NSString stringWithFormat: @"IDFV: %@", [dic objectForKey:@"idfv"]];
    self.mdfiveHashedStrLabel.text = [NSString stringWithFormat:@"MD5Hash: %@", [dic objectForKey:@"hashed"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
