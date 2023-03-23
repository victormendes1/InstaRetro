//
//  Support.h
//  InstaRetro
//
//  Created by Victor Mendes on 16/03/23.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface Support : NSObject

- (UINavigationController *)configureCustomNavigationControllerWithRoot:(UIViewController *)withRootViewController;
- (NSArray *)postDecoder:(NSData *)postData;
- (NSString *)formattedPublicationDate:(NSString *)dateString;
- (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
