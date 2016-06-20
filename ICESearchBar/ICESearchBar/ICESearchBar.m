
//
//  ICESearchBar.m
//  ICEVFLTest
//
//  Created by WLY on 16/6/20.
//  Copyright © 2016年 ICE. All rights reserved.
//

#import "ICESearchBar.h"


@interface ICESearchBar ()

@property (nonatomic, strong) UIView *contentView;


@end

@implementation ICESearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self p_subviews];
    }
    return self;
}

- (void)p_subviews{

    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_contentView];
    
    NSDictionary *views_contentView = NSDictionaryOfVariableBindings(_contentView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[_contentView]-1-|" options:0 metrics:nil views:views_contentView]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[_contentView]-1-|" options:0 metrics:nil views:views_contentView]];
    
    
    
    
    
    
}

@end
