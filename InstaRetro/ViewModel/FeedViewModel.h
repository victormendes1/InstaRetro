//
//  FeedViewModel.h
//  InstaRetro
//
//  Created by Victor Mendes on 18/01/23.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "Post.h"
#import "FBLPromises.h"
#import <FBLPromises/FBLPromises.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CompletionBlock)(NSArray<Post *> *);
//typedef void (^CompletionBlock)(NSArray<Post *> *);

@interface FeedViewModel : NSObject

@property(strong, nonatomic) NetworkManager *service;

- (void)loadFeed:(CompletionBlock)completion;
//- (void)loadFeedImagens:()

@end

NS_ASSUME_NONNULL_END
