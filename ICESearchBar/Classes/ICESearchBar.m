
//
//  ICESearchBar.m
//  ICEVFLTest
//
//  Created by WLY on 16/6/20.
//  Copyright © 2016年 ICE. All rights reserved.
//

#import "ICESearchBar.h"

const static CGFloat ICE_Spacing = 8;




@interface ICESearchBar ()<UITextFieldDelegate>{

    NSString    *_palceholderText;
    UIView      *_contentView;
    UIButton    *_rightBtn;
    
}

@property (nonatomic, copy  ) SearchResultBlock searchBlock;
@property (nonatomic, copy  ) SearchResultBlock finishBlock;
@property (nonatomic, copy  ) SearchResultBlock beginBlock;


@end

@implementation ICESearchBar


CGFloat H(UIView *view){
    return CGRectGetHeight(view.bounds);
}

CGFloat W(UIView *view){
    return CGRectGetWidth(view.bounds);
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initConfig];
        [self p_subviews];
    }
    return self;
}

- (instancetype)init{

    self = [super init];
    if (self) {
        [self p_initConfig];
        [self p_subviews];
    }
    return self;
}

- (instancetype)initWithPlaceholderText:(NSString *)placeholderText{

    self = [super init];
    if (self) {
        [self p_initConfig];
        _palceholderText = placeholderText;
        [self p_subviews];
    }
    return self;
}



/**
 *  初始化配置
 */
- (void)p_initConfig{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.layer.borderWidth = 1.0;
    _palceholderText = @"请输入您要搜索的内容...";
}
//创建子视图
- (void)p_subviews{
    
    _contentView = [[UIView alloc] init];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_contentView];
    
    _searchTF = [[UITextField alloc] init];
    _searchTF.placeholder = _palceholderText;
    _searchTF.delegate = self;
    _searchTF.textAlignment = NSTextAlignmentLeft;
    _searchTF.font = [UIFont systemFontOfSize:14];
    _searchTF.returnKeyType = UIReturnKeyDone;
    [_contentView addSubview:_searchTF];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged) name:UITextFieldTextDidChangeNotification object:nil];

    _rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_rightBtn setBackgroundImage:[[UIImage imageNamed:@"icon-search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
    [_contentView addSubview:_rightBtn];
    
    [_rightBtn addTarget:self action:@selector(p_handleSearchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}


//布局
- (void)layoutSubviews{

    [super layoutSubviews];

    _contentView.frame = CGRectMake(ICE_Spacing, 0, W(self) - 2 * ICE_Spacing, H(self));
    _searchTF.frame = CGRectMake(0, 0, W(_contentView) - H(_contentView), H(_contentView));
    _rightBtn.frame = CGRectMake(W(_searchTF) + ICE_Spacing, ICE_Spacing, H(_contentView) - 2 * ICE_Spacing, H(_contentView) - 2 * ICE_Spacing);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _searchBlock = nil;
    _finishBlock = nil;
    _beginBlock = nil;
    
}

#pragma mark - TFDelegate
- (void)textFieldChanged{

    if (self.searchBlock) {
        self.searchBlock(self.searchTF.text);
    }
}

- (void)p_handleSearchBtnAction{
    if (self.finishBlock) {
        self.finishBlock(self.searchTF.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.searchTF resignFirstResponder];
    if (self.finishBlock) {
        self.finishBlock(textField.text);
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.beginBlock) {
        self.beginBlock(textField.placeholder);
    }
    return YES;
}

- (BOOL)resignFirstResponder{
    
    [self.searchTF resignFirstResponder];
    return YES;
}


- (void)updateSearchBar:(SearchResultBlock)completion{
    _searchBlock = completion;
}


- (void)finishInput:(SearchResultBlock)completion{
    
    _finishBlock = completion;
}

- (void)beginInput:(SearchResultBlock)completion{
    
    _beginBlock = completion;
}



@end
