//
//  FeedViewModel.m
//  InstaRetro
//
//  Created by Victor Mendes on 18/01/23.
//

#import "FeedViewModel.h"

@implementation FeedViewModel

- (void)loadFeed:(CompletionBlock)completion {
    NetworkManager *service = NetworkManager.new;
    NSMutableArray *postCompleted = NSMutableArray.new;
    
    [service fetchPostInfo:^(NSArray<Post *> *infos) {
        //TODO: Refatorar essa lógica
        for (Post *post in infos) {
            [service fetchImageData:post.postUrl result:^(NSData *imageData) {
                post.postImage = [UIImage imageWithData:imageData];
                [postCompleted addObject:post];
            }];
        }
        //TODO: Refatorar essa lógica
        for (Post *post in infos) {
            [service fetchImageData:post.profiletUrl result:^(NSData *imageData) {
                post.profileImage = [UIImage imageWithData:imageData];
            }];
            [postCompleted addObject:post];
        }
        
        completion(postCompleted);
    }];
}

@end
