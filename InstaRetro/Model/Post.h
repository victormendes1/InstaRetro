//
//  Post.h
//  InstaRetro
//
//  Created by Victor Mendes on 13/01/23.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

//@interface Urls : NSObject
//
//@property (strong, nonatomic) NSString *profile;
//@property (strong, nonatomic) NSString *post;
//
//@end

@interface Post : NSObject

@property (strong, nonatomic) NSString *createdAt;
@property (strong, nonatomic) NSString *localization;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *postDescription;
@property (strong, nonatomic) NSString *postUrl;
@property (strong, nonatomic) NSString *profiletUrl;
@property (strong, nonatomic) NSString *likes;
@property (strong, nonatomic) UIImage *postImage;
@property (strong, nonatomic) UIImage *profileImage;

@end


NS_ASSUME_NONNULL_END
