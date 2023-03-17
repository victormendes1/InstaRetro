//
//  Support.m
//  InstaRetro
//
//  Created by Victor Mendes on 16/03/23.
//

#import "Support.h"

@implementation Support

///This function creates a custom navigationController
- (UINavigationController *)configureCustomNavigationControllerWithRoot:(UIViewController *)withRootViewController {
    UINavigationController *navigationController = [UINavigationController.new initWithRootViewController:withRootViewController];
    UINavigationBarAppearance *appearance = UINavigationBarAppearance.new;
    
    withRootViewController.title = @"InstaRetro";
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIFont fontWithName:@"Billabong" size:30],NSFontAttributeName, nil];
    
    [appearance configureWithDefaultBackground];
    appearance.backgroundColor = [UIColor colorWithRed:2.0f/255.0f
                                                 green:95.0f/255.0f
                                                  blue:164.0f/255.0f
                                                 alpha:1];
    
    appearance.titleTextAttributes = textAttributes;
    navigationController.navigationBar.standardAppearance = appearance;
    navigationController.navigationBar.scrollEdgeAppearance = appearance;
    navigationController.navigationBar.compactAppearance = appearance;
    navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    return navigationController;
}

@end
