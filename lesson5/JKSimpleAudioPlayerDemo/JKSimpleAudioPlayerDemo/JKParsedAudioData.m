//
//  JKParsedAudioData.m
//  JKSimpleAudioPlayerDemo
//
//  Created by Jack on 16/6/17.
//  Copyright © 2016年 Jack. All rights reserved.
//

#import "JKParsedAudioData.h"
#import <CoreAudio/CoreAudioTypes.h>


@implementation JKParsedAudioData
@synthesize data = _data;
@synthesize packetDescription = _packetDescription;

+ (instancetype)parseAudioDataWithBytes:(const void *)bytes
                      packetDescription:(AudioStreamPacketDescription)packetDescription {
    return [[self alloc] initWithBytes:bytes
                     packetDescription:packetDescription];
}

- (instancetype)initWithBytes:(const void *)bytes packetDescription:(AudioStreamPacketDescription)packetDescription {
    if (bytes == NULL || packetDescription.mDataByteSize == 0) {
        return nil;
    }
    
    if (self = [super init]) {
        _data = [NSData dataWithBytes:bytes length:packetDescription.mDataByteSize];
        _packetDescription = packetDescription;
    }
    return self;
}



@end
