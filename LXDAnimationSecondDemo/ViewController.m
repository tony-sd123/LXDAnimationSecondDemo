//
//  ViewController.m
//  LXDAnimationSecondDemo
//
//  Created by 林欣达 on 16/2/2.
//  Copyright © 2016年 SindriLin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *leaf;           ///<    树叶
@property (strong, nonatomic) IBOutlet UILabel *summer;
@property (strong, nonatomic) IBOutlet UILabel *autumn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [UIView animateKeyframesWithDuration: 4 delay: 0 options: UIViewKeyframeAnimationOptionCalculationModeCubic animations: ^{
        __block CGPoint center = _leaf.center;
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 0.1 animations: ^{
            _leaf.center = (CGPoint){ center.x + 25, center.y + 80 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.1 relativeDuration: 0.15 animations: ^{
            _leaf.center = (CGPoint){ center.x + 45, center.y + 195 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.25 relativeDuration: 0.3 animations: ^{
            _leaf.center = (CGPoint){ center.x + 90, center.y + 295 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.55 relativeDuration: 0.3 animations: ^{
            _leaf.center = (CGPoint){ center.x + 180, center.y + 375 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.85 relativeDuration: 0.15 animations: ^{
            _leaf.center = (CGPoint){ center.x + 260, center.y + 435 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 1 animations: ^{
            _leaf.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    } completion: nil];
    
    CGFloat offset = _autumn.frame.size.height / 2;
    _autumn.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 0), CGAffineTransformMakeTranslation(0, -offset));
    CGAffineTransform transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 0.05), CGAffineTransformMakeTranslation(0, offset));
    
    [UIView animateWithDuration: 4 animations: ^{
        _autumn.alpha = 1;
        _summer.alpha = 0;
        _autumn.transform = CGAffineTransformIdentity;
        _summer.transform = transform;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
