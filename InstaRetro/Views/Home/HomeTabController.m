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

// MARK: Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewControllers];
    [self setTabBar];
    [self setBarButton];
}

- (void)setViewControllers {
    FeedViewController *feedViewController = FeedViewController.new;
    UIViewController *fakesearchViewController = UIViewController.new;
    UIViewController *fakeCameraViewController = UIViewController.new;
    UIViewController *fakeActivityViewController = UIViewController.new;
    UIViewController *fakeProfileViewController = UIViewController.new;
    
    NSArray<UIViewController *> *views = [NSArray arrayWithObjects:
                                          feedViewController,
                                          fakesearchViewController,
                                          fakeCameraViewController,
                                          fakeActivityViewController,
                                          fakeProfileViewController, nil];
    [self setViewControllers:views];
}

- (void)setBarButton {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.new initWithImage:
                                             [UIImage systemImageNamed:@"tray.fill"]
                                             style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor;
}

- (void)setTabBar {
    self.tabBar.items[0].image = [UIImage systemImageNamed:@"house.fill"];
    self.tabBar.items[1].image = [UIImage systemImageNamed:@"magnifyingglass"];
    self.tabBar.items[2].image = [UIImage systemImageNamed:@"camera"];
    self.tabBar.items[3].image = [UIImage systemImageNamed:@"heart.circle.fill"];
    self.tabBar.items[4].image = [UIImage systemImageNamed:@"person.fill"];
    
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.tintColor = UIColor.whiteColor;
}

@end
