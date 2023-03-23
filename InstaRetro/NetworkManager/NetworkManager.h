//
//  NetworkManager.h
//  InstaRetro
//
//  Created by Victor Mendes on 18/01/23.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import "Endpoint.h"
#import "Support.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CompletionBlock)(NSArray<Post *> *);
typedef void (^ResultRaw)(NSData *);

@interface NetworkManager : NSObject

- (void)fetchPostInfo:(CompletionBlock)completion;
- (void)fetchImageData:(NSString *)urlString result:(ResultRaw)completion;

@end

NS_ASSUME_NONNULL_END
