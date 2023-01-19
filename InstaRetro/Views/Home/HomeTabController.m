//
//  HomeTabController.m
//  InstaRetro
//
//  Created by Victor Mendes on 17/01/23.
//

#import "HomeTabController.h"
#import "FeedViewController.h"

@interface HomeTabController ()

@end

@implementation HomeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FeedViewController *feedViewController = FeedViewController.new;
    UIViewController *searchViewController = UIViewController.new;
    UIViewController *fakeCameraViewController = UIViewController.new;
    UIViewController *fakeActivityViewController = UIViewController.new;
    UIViewController *fakeProfileViewController = UIViewController.new;
    
    NSArray<UIViewController *> *views = [NSArray arrayWithObjects: feedViewController, searchViewController, fakeCameraViewController, fakeActivityViewController, fakeProfileViewController, nil];
    [views arrayByAddingObject:searchViewController];
    
    [self setViewControllers:views];
    
    [self setIcons];
    self.title = @"InstaRetro";
    // [self setNavigationController];
    
}

- (void)setIcons {
    UIImage *camera = [UIImage systemImageNamed:@"camera"];
    
    self.tabBar.items[0].image = [UIImage systemImageNamed:@"house.fill"];
    self.tabBar.items[1].image = [UIImage systemImageNamed:@"magnifyingglass"];
    self.tabBar.items[2].image = [UIImage systemImageNamed:@"camera"];
    self.tabBar.items[3].image = [UIImage systemImageNamed:@"heart.circle.fill"];
    self.tabBar.items[4].image = [UIImage systemImageNamed:@"person.fill"];
    
    self.tabBar.backgroundImage = [UIImage systemImageNamed:@"star"];
    
    self.tabBar.tintColor = UIColor.systemGrayColor;
    self.tabBar.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.95];
    [[UITabBar appearance] backgroundImage];
    [[UITabBar appearance] setSelectedImageTintColor: [UIColor.whiteColor colorWithAlphaComponent:0.8]];
}

//- (void)setNavigationController {
//    self.title = @"Instagram";
//
//    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    [UIColor blueColor],NSForegroundColorAttributeName,
//                                    [UIFont fontWithName:@"Billabong" size:21],NSFontAttributeName, nil];
//    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
//
////    UINavigationBarAppearance *appearance = UINavigationBarAppearance.new;
////    [appearance configureWithOpaqueBackground];
////    appearance.backgroundColor = UIColor.blueColor;
////    navigationController.navigationBar.standardAppearance = appearance;
////    navigationController.navigationBar.scrollEdgeAppearance = appearance;
////    navigationController.navigationBar.compactAppearance = appearance;
//}
@end


@interface UIImage(Overlay)
@end

@implementation UIImage(Overlay)

- (UIImage *)imageWithColor:(UIColor *)color1
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color1 setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
