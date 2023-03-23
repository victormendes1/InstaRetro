//
//  Endpoint.h
//  InstaRetro
//
//  Created by Victor Mendes on 20/03/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Endpoint : NSObject

@property NSURL *url;
-(NSURL *)fullURL;

@end

NS_ASSUME_NONNULL_END
