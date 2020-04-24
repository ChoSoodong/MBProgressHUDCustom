




#import "MBProgressHUD.h"

// 统一的显示时长
#define kHudShowTime 1.5
#define kHudShowText @"加载中..."
#define kIsUserInteractionEnabled YES //提示框显示时,是否允许点击屏幕其他地方, NO:允许,YES:不允许

@interface MBProgressHUD (CustomHUD)

#pragma mark 在指定的view上显示hud
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showWarning:(NSString *)Warning toView:(UIView *)view;
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showActivityMessage:(NSString*)message view:(UIView *)view;
+ (MBProgressHUD *)showProgress:(CGFloat)progress toView:(UIView *)view; //view可以传nil 进度走完, 自动隐藏
+ (MBProgressHUD *)showProgress:(CGFloat)progress status:(NSString *)status toView:(UIView *)view; //进度走完, 自动隐藏


#pragma mark 在window上显示hud
+ (void)showMessage:(NSString *)message;//文字
+ (void)showSuccess:(NSString *)success;//成功 + 文字
+ (void)showError:(NSString *)error; //错误 + 文字
+ (void)showWarning:(NSString *)Warning;//警告 + 文字
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message;//自定义图片+文字
+ (void)show; //转圈
+ (void)showActivityMessage:(NSString*)message; //转圈+文字

+ (void)showProgress:(CGFloat)progress; //显示进度,默认文字为"加载中..." 进度走完, 自动隐藏
+ (void)showProgress:(CGFloat)progress status:(NSString *)status;//显示进度,自定义显示文字 进度走完, 自动隐藏

#pragma mark 移除hud
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
