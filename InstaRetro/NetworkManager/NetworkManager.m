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
    NSLog(@"Iniciando a buscar os posts");
    
    NSString *urlString = @"https://api.unsplash.com/photos/?client_id=lX6ynWU7KHZ9eLWAk22PndmAmKeDnBKzaLuCT-7l4FY";
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Finalizado de buscar os posts");
        
        NSError *errorSerialization;
        NSArray *postsJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errorSerialization];
        
        if (errorSerialization) {
            NSLog(@"Problema ao deserializar");
            return;
        }
        
        NSMutableArray< Post *> *posts = NSMutableArray.new;
        
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
                postObject.postDescription = sponsorDict[@"tagline"];
            } else {
                postObject.postDescription = postDict[@"alt_description"];
            }
            [posts addObject:postObject];
        }
        
        completion(posts);
    }] resume];
}

// MARK: - Fetch Image
- (void)fetchImageData:(NSString *)urlString result:(ResultRaw)completion {
    NSLog(@"Iniciando a buscar por imagens");
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Finalizado de buscar os posts");
        completion(data);
    }] resume];
}

@end
