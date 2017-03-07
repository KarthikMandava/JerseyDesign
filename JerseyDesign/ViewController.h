//
//  ViewController.h
//  JerseyDesign
//
//  Created by User1 on 3/3/17.
//  Copyright © 2017 User1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *vwForImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfVw;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfVw;

@property (strong, nonatomic) IBOutlet UIButton *btnForRed;
@property (strong, nonatomic) IBOutlet UIButton *btnForGray;
@property (strong, nonatomic) IBOutlet UIButton *btnForGreen;
@property (strong, nonatomic) IBOutlet UIButton *btnForYellow;
@property (strong, nonatomic) IBOutlet UIButton *btnForBlue;
@property (strong, nonatomic) IBOutlet UIButton *btnForOrange;


// redColor lightGrayColor greenColor yellowColor blueColor orangeColor

- (IBAction)onClickNext:(UIButton *)sender;

@end

