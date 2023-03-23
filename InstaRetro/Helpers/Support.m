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

- (NSArray *)postDecoder:(NSData *)postData {
    NSMutableArray< Post *> *posts = NSMutableArray.new;
    NSError *errorSerialization;
    NSArray *postsJSON = [NSJSONSerialization JSONObjectWithData:postData options:NSJSONReadingAllowFragments error:&errorSerialization];
    
    if (errorSerialization) {
        NSLog(@"Error decoding");
        return NSArray.new;
    }
    
    for (NSDictionary *postDict in postsJSON) {
        Post *postObject = Post.new;
        
        NSDictionary *userDict = postDict[@"user"];
        NSDictionary *sponsorDict = postDict[@"sponsorship"];
        NSDictionary *urlDict = postDict[@"urls"];
        NSDictionary *profileDict = userDict[@"profile_image"];
       
        postObject.createdAt = postDict[@"created_at"];
        postObject.user = userDict[@"username"];
        postObject.likes = postDict[@"likes"];
        postObject.postUrl = urlDict[@"regular"];
        postObject.profiletUrl = profileDict[@"medium"];
        
        
        if(userDict[@"location"] != NSNull.new) {
            postObject.localization = userDict[@"location"];
        }
        
         if (postDict[@"alt_description"] == NSNull.new) {
             postObject.postDescription = @"";
        }  if (postDict[@"sponsorship"] == NSNull.new) {
            
        } else {
            postObject.postDescription = sponsorDict[@"tagline"];
        }
        [posts addObject:postObject];
    }
    return posts;
}

- (NSString *)formattedPublicationDate:(NSString *)dateString {
    NSDateFormatter *dateFormat = NSDateFormatter.new;
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *date = [dateFormat dateFromString:dateString];
    NSString *formattedDate = NSString.new;
    
    int seconds = [date timeIntervalSinceNow] * -1;
    int minutes = seconds / 60;
    int hours = minutes / 60;
    int days = hours / 24;
    int weeks = days / 7;
    
    if ((hours / 24) > 7) {
        formattedDate = [NSString stringWithFormat:@"%dw", weeks];
    } else if (hours > 24) {
        formattedDate = [NSString stringWithFormat:@"%dd", days];
    } else if (hours < 24 && hours >= 1) {
        formattedDate = [NSString stringWithFormat:@"%dh", hours];
    } else if (hours < 1 && minutes > 1) {
        formattedDate = [NSString stringWithFormat:@"%dm", minutes];
    } else if (minutes < 1) {
        formattedDate = [NSString stringWithFormat:@"%ds", seconds];
    }
    return formattedDate;
}

- (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size {
    double refWidth = CGImageGetWidth(image.CGImage);
    double refHeight = CGImageGetHeight(image.CGImage);

    double x = (refWidth - size.width) / 4;
    double y = (refHeight - size.height) / 1;

    CGRect cropRect = CGRectMake(x, y, size.height, size.width);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);

    UIImage *cropped = [UIImage imageWithCGImage:imageRef scale:0 orientation:image.imageOrientation];
    CGImageRelease(imageRef);

    return cropped;
}

@end
