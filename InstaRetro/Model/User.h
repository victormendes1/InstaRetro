//
//  User.h
//  InstaRetro
//
//  Created by Victor Mendes on 18/01/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSString *location;

@end

NS_ASSUME_NONNULL_END
