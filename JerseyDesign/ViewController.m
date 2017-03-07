//
//  ViewController.m
//  JerseyDesign
//
//  Created by User1 on 3/3/17.
//  Copyright © 2017 User1. All rights reserved.
//

#import "ViewController.h"
#import "TGDrawSvgPathView.h"

@interface ViewController ()
{
    BOOL isNextSelected;
    NSInteger indexValue;
}
@property (nonatomic, strong) CAShapeLayer* shapeView;
@property (nonatomic, strong) TGDrawSvgPathView* tgView;
@property (nonatomic) CFTimeInterval animationDuration;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    indexValue=0;
    _animationDuration=0;
    
    CGFloat widthOfVw=self.view.frame.size.width-40;
  
    _widthOfVw.constant=widthOfVw;
    _heightOfVw.constant = widthOfVw;
    
    [self.vwForImage updateConstraints];
    self.vwForImage.backgroundColor=[UIColor clearColor];
    
    _tgView = [[TGDrawSvgPathView alloc] initWithFrame:CGRectMake(0,0, widthOfVw,widthOfVw)];
    [_tgView setPathFromSvg:@"01_Body" strokeColor:[UIColor blackColor] fillColor:[UIColor lightGrayColor] duration:_animationDuration];
    [self.vwForImage addSubview:_tgView];
    [_tgView setPathFromSvg:@"02_Newpattern" strokeColor:[UIColor blackColor] fillColor:[UIColor lightGrayColor] duration:_animationDuration];
    [self.vwForImage addSubview:_tgView];
    [self setUpColorBtns];
    self.vwForImage.userInteractionEnabled = YES;
}

-(void)setUpColorBtns{
    
    self.btnForBlue.backgroundColor=[UIColor blueColor];
    self.btnForGray.backgroundColor=[UIColor lightGrayColor];
    self.btnForGreen.backgroundColor=[UIColor greenColor];
    self.btnForOrange.backgroundColor=[UIColor orangeColor];
    self.btnForRed.backgroundColor=[UIColor redColor];
    self.btnForYellow.backgroundColor=[UIColor yellowColor];
    
    [self roundCornerBtn:self.btnForBlue];
    [self roundCornerBtn:self.btnForGray];
    [self roundCornerBtn:self.btnForGreen];
    [self roundCornerBtn:self.btnForOrange];
    [self roundCornerBtn:self.btnForRed];
    [self roundCornerBtn:self.btnForYellow];
    
    [self.btnForBlue addTarget:self action:@selector(onClickBlue) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForGray addTarget:self action:@selector(onClickGray) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForGreen addTarget:self action:@selector(onClickGreen) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForOrange addTarget:self action:@selector(onClickOrange) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForRed addTarget:self action:@selector(onClickRed) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForYellow addTarget:self action:@selector(onClickYellow) forControlEvents:UIControlEventTouchUpInside];
}

-(void)roundCornerBtn:(UIButton*)sender{
    sender.layer.cornerRadius = sender.frame.size.height/2;
    sender.layer.masksToBounds = YES;
}
- (IBAction)onClickNext:(UIButton *)sender {
    if (sender.tag == 1) {
        indexValue=0;
    }else{
        indexValue=1;
    }
}

-(void)onClickBlue{
 
    [self setColor:[UIColor blueColor]];
}

-(void)onClickGray{
     [self setColor:[UIColor lightGrayColor]];
}
-(void)onClickGreen{
       [self setColor:[UIColor greenColor]];
}
-(void)onClickOrange{
       [self setColor:[UIColor orangeColor]];
}

-(void)onClickRed{
        [self setColor:[UIColor redColor]];
}

-(void)onClickYellow{
       [self setColor:[UIColor yellowColor]];
}

-(void)setColor:(UIColor*)color{
    
    NSMutableArray *array=[[NSMutableArray alloc] init];
    array =[_tgView.layer.sublayers mutableCopy];
    
    for (CAShapeLayer *layer in _tgView.layer.sublayers) {
        if ([_tgView.layer.sublayers indexOfObject:layer] == indexValue) {
            layer.fillColor=color.CGColor;
            layer.strokeColor=[UIColor clearColor].CGColor;
            [array replaceObjectAtIndex:indexValue withObject:layer];
            _tgView.layer.sublayers = array;
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInView:_tgView];
        for (id sublayer in _tgView.layer.sublayers) {
            if ([sublayer isKindOfClass:[CAShapeLayer class]]) {
                CAShapeLayer *shapeLayer = sublayer;
                if (CGPathContainsPoint(shapeLayer.path, 0, touchLocation, YES)) {
                    indexValue=[_tgView.layer.sublayers indexOfObject:sublayer];
                }
            } else {
                CALayer *layer = sublayer;
                if (CGRectContainsPoint(layer.frame, touchLocation)) {
                }
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
