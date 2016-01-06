//
//  NextViewController.m
//  Animation
//
//  Created by shitaotao on 16/1/6.
//  Copyright © 2016年 shitaotao. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (nonatomic, strong) CAGradientLayer * shadomLayer;
- (IBAction)paning:(UIPanGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *topView;
@end

@implementation NextViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.topView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    self.bottomView.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
}
- (IBAction)paning:(UIPanGestureRecognizer *)sender {
    // 获取手指偏移量
    CGPoint transP = [sender translationInView:self.view];
    // 初始化形变
    CATransform3D transform3D = CATransform3DIdentity;
    // 设置立体效果
    transform3D.m34 = -1 / 1000.0;
    // 计算折叠角度，因为需要逆时针旋转，所以取反
    CGFloat angle = -transP.y / 375.0 * M_PI;
    _topView.layer.transform = CATransform3DRotate(transform3D, angle, 0.7, 0, 0);
    if (sender.state == UIGestureRecognizerStateEnded) { // 手指抬起
        // 还原
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _topView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
@end
