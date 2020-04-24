
#import "MBProgressHUD+CustomHUD.h"

@implementation MBProgressHUD (CustomHUD)

#pragma mark 显示一条信息
+ (void)showMessage:(NSString *)message toView:(UIView *)view{
    [self show:message icon:nil view:view];
}

#pragma mark 显示带图片或者不带图片的信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled= kIsUserInteractionEnabled;
    hud.labelText = text;
    // 判断是否显示图片
    if (icon == nil) {
        hud.mode = MBProgressHUDModeText;
    }else{
        // 设置图片
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
        img = img == nil ? [UIImage imageNamed:icon] : img;
        hud.customView = [[UIImageView alloc] initWithImage:img];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
    }
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 指定时间之后再消失
    [hud hide:YES afterDelay:kHudShowTime];
}

#pragma mark 显示成功信息
+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

#pragma mark 显示警告信息
+ (void)showWarning:(NSString *)Warning toView:(UIView *)view{
    [self show:Warning icon:@"warn" view:view];
}

#pragma mark 显示自定义图片信息
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message toView:(UIView *)view{
    [self show:message icon:imageName view:view];
}

#pragma mark 加载中
+ (MBProgressHUD *)showActivityMessage:(NSString*)message view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled= kIsUserInteractionEnabled;
    hud.labelText = message;
    // 细节文字(加载中...的下面显示)
      //  hud.detailsLabelText = @"请耐心等待";
    // 再设置模式
    hud.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

+ (MBProgressHUD *)showProgress:(CGFloat)progress toView:(UIView *)view{

    return [MBProgressHUD showProgress:progress status:nil toView:view];
}
+ (MBProgressHUD *)showProgress:(CGFloat)progress status:(NSString *)status toView:(UIView *)view{
    
    view = view == nil? [[UIApplication sharedApplication].windows lastObject] : view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled= kIsUserInteractionEnabled;
    hud.mode = MBProgressHUDModeDeterminate;
    hud.labelText = status == nil ? kHudShowText : status;
    [hud hide:YES]; //先移除, 因为每次赋值progress时,都会创建一个hud
    hud.progress = progress;
    if (progress >= 1.0f) {
        [hud hide:YES];
    }
    
    return hud;
}






#pragma mark - 在window上显示
+ (void)show{
    
    [MBProgressHUD showActivityMessage:nil];

}

+ (void)showMessage:(NSString *)message{
    [self showMessage:message toView:nil];
}

+ (void)showSuccess:(NSString *)success{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error{
    [self showError:error toView:nil];
}

+ (void)showWarning:(NSString *)Warning{
    [self showWarning:Warning toView:nil];
}

+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message{
    [self showMessageWithImageName:imageName message:message toView:nil];
}

+ (void)showActivityMessage:(NSString*)message{
    [MBProgressHUD showActivityMessage:message view:nil];
}
//显示进度
+ (void)showProgress:(CGFloat)progress{
    
    [MBProgressHUD showProgress:progress status:nil];
}
//显示进度,自定义显示文字
+ (void)showProgress:(CGFloat)progress status:(NSString *)status{
    
    [MBProgressHUD showProgress:progress status:status toView:nil];
}


#pragma mark - 隐藏
+ (void)hideHUDForView:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD{
    [self hideHUDForView:nil];
}
@end
