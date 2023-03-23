//
//  Endpoint.m
//  InstaRetro
//
//  Created by Victor Mendes on 20/03/23.
//

#import "Endpoint.h"

@implementation Endpoint

-(NSURL *)fullURL {
    NSString *key = @"lX6ynWU7KHZ9eLWAk22PndmAmKeDnBKzaLuCT-7l4FY&page=10";
    NSString *urlString = [NSString stringWithFormat:@"https://api.unsplash.com/photos/?client_id=%@", key];
    self.url = [NSURL URLWithString:urlString];
    return self.url;
}

@end
