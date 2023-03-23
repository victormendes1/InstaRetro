//
//  NetworkManager.m
//  InstaRetro
//
//  Created by Victor Mendes on 18/01/23.
//

#import "NetworkManager.h"

@implementation NetworkManager
// MARK: - Fetch Infos
- (void)fetchPostInfo:(CompletionBlock)completion {
    NSURL *url = [Endpoint.new fullURL];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion([Support.new postDecoder:data]);
    }] resume];
}

// MARK: - Fetch Image
- (void)fetchImageData:(NSString *)urlString result:(ResultRaw)completion {
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion(data);
    }] resume];
}

@end
