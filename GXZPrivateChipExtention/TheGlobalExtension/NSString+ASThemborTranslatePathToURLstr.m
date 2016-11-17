//
//  NSString+GXZPCEThemborTranslatePathToURLstr.m
//  AVarSha
//
//  Created by MD_GAO on 11/4/15.
//  Copyright © 2015 MD_GAO. All rights reserved.
//

#import "NSString+ASThemborTranslatePathToURLstr.h"

@implementation NSString (GXZPCEThemborTranslatePathToURLstr)


-(NSString*)getGXZPCEThemborTranslatePathToURLstrOfSize:(CGSize)imageSize
{
    
//    TUOptions *opts = [[TUOptions alloc] init];
//    
//    NSURL *imageURL = [NSURL URLWithString:self];
//    NSURL *baseURL = [NSURL URLWithString:@"http://www.avarshacdn.com"];
//    NSString *key = THUMBOR_SECURITY_KEY;
//    
//    //opts.crop = CGRectMake(20, 20, 20, 20);
//    opts.smart = YES;
//    opts.targetSize = imageSize;
   // opts.fitIn = TUFitInNormal;
   // opts.vflip = YES;
//    opts.filters = @[[TUFilter filterWithName:@"watermark" arguments:@"blah.png", @"10", @"20", @"30", nil],
//                     [TUFilter filterWithName:@"watermark" arguments:@"baz.png", @"4", @"8", @"15", nil]];
    
//    NSURL * tempUrl = [NSURL TU_secureURLWithOptions:opts imageURL:imageURL baseURL:baseURL securityKey:key];
//    
//    if([[tempUrl absoluteString] isEqualToString:tempUrl.relativePath])
//    {
//        return @"";
//    }
//
//    return [tempUrl absoluteString];
    return  @"";
}

-(NSString*)getGXZPCEThemborTranslatePathToURLstrOfSize:(CGSize)imageSize with:(CGRect)crop
{
//    TUOptions *opts = [[TUOptions alloc] init];
//    
//    NSURL *imageURL = [NSURL URLWithString:self];
//    NSURL *baseURL = [NSURL URLWithString:@"http://www.avarshacdn.com"];
//    NSString *key = THUMBOR_SECURITY_KEY;
//    
//    opts.crop = crop;
//    opts.smart = YES;
//    opts.targetSize = imageSize;
//    // opts.fitIn = TUFitInNormal;
//    // opts.vflip = YES;
//    //    opts.filters = @[[TUFilter filterWithName:@"watermark" arguments:@"blah.png", @"10", @"20", @"30", nil],
//    //                     [TUFilter filterWithName:@"watermark" arguments:@"baz.png", @"4", @"8", @"15", nil]];
//    
//    NSURL * tempUrl = [NSURL TU_secureURLWithOptions:opts imageURL:imageURL baseURL:baseURL securityKey:key];
//    
//    if([[tempUrl absoluteString] isEqualToString:tempUrl.relativePath])
//    {
//        return @"";
//    }
//    
//    return [tempUrl absoluteString];
    return @"";

}
@end
