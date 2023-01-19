//
//  SceneDelegate.m
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import "SceneDelegate.h"
#import "HomeTabController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [UIWindow.new initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = [self setNavigationBarWithButton];
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

// MARK: - setNavigationBar
- (UINavigationController *)setNavigationBarWithButton  {
    HomeTabController *viewController = HomeTabController.new;
    UINavigationController *navigationController = [UINavigationController.new initWithRootViewController:viewController];
    UINavigationBarAppearance *appearance = UINavigationBarAppearance.new;
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIColor whiteColor],NSForegroundColorAttributeName,
                                   [UIFont fontWithName:@"Billabong" size:35],NSFontAttributeName, nil];
    
    
    [appearance configureWithDefaultBackground];
    appearance.backgroundColor = [UIColor colorWithRed:2.0f/255.0f
                                                 green:95.0f/255.0f
                                                  blue:164.0f/255.0f
                                                 alpha:1];
    appearance.titleTextAttributes = textAttributes;
   
    navigationController.navigationBar.standardAppearance = appearance;
    navigationController.navigationBar.scrollEdgeAppearance = appearance;
    navigationController.navigationBar.compactAppearance = appearance;
    
    viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem.new initWithImage:[UIImage systemImageNamed:@"tray.fill"] style:UIBarButtonItemStylePlain target:self action:nil];
    viewController.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    return navigationController;
}

@end
