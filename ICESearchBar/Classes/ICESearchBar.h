//
//  ICESearchBar.h
//  ICEVFLTest
//
//  Created by WLY on 16/6/20.
//  Copyright © 2016年 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SearchResultBlock)(NSString *text);


@interface ICESearchBar : UIView
@property (nonatomic, strong, readonly) UITextField *searchTF;



/**
 *  initializes and returns a newly alloated SearcchBar view object with the specified  "placeholderText"
 *
 *  @param placeholderText Defaule show Text string
 */
- (instancetype)initWithPlaceholderText:(NSString *)placeholderText;


/**
 *  每一次字符变化 均有回调
 */
- (void)updateSearchBar:(SearchResultBlock)completion;
/**
 *  输入结束 按下回车键时的回调
 */
- (void)finishInput:(SearchResultBlock)completion;
/**
 *  开始输入回调, 传递 placeholder
 */
- (void)beginInput:(SearchResultBlock)completion;





@end
