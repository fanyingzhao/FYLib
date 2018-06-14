//
//  FYVideoHelper.m
//  FFKit
//
//  Created by fan on 17/3/14.
//  Copyright © 2017年 fan. All rights reserved.
//

#import "FYVideoHelper.h"
#import <AVFoundation/AVFoundation.h>

@implementation FYVideoHelper

+ (void)tailorVideo:(NSString *)path exportPath:(NSString *)exportPath size:(CGSize)size transform:(CGAffineTransform)transform completion:(void (^)(NSError * error))completionBlock {
    AVAsset* asset = [AVAsset assetWithURL:[NSURL fileURLWithPath:path]];
    
    AVAssetTrack *clipVideoTrack = [[asset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    
    AVMutableVideoComposition* videoComposition = [AVMutableVideoComposition videoComposition];
    videoComposition.frameDuration = CMTimeMake(1, CMTimeGetSeconds(asset.duration));
    videoComposition.renderSize = size;
    
    CALayer *parentLayer = [CALayer layer];
    CALayer *videoLayer = [CALayer layer];
    videoLayer.frame = CGRectMake(0, 0, size.width, size.height);
    parentLayer.frame = CGRectMake(0, 0, size.width, size.height);
    [parentLayer addSublayer:videoLayer];
    
    videoComposition.animationTool = [AVVideoCompositionCoreAnimationTool videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:videoLayer inLayer:parentLayer];
    
    AVMutableVideoCompositionInstruction *instruction = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
    instruction.timeRange = CMTimeRangeMake(kCMTimeZero, asset.duration);
    
    
    AVMutableVideoCompositionLayerInstruction *avMutableVideoCompositionLayerInstruction = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:clipVideoTrack];
    CGAffineTransform t1 = clipVideoTrack.preferredTransform;
    t1 = CGAffineTransformConcat(t1, transform);
    [avMutableVideoCompositionLayerInstruction setTransform:t1 atTime:kCMTimeZero];
    
    instruction.layerInstructions = [NSArray arrayWithObject:avMutableVideoCompositionLayerInstruction];
    
    videoComposition.instructions = [NSArray arrayWithObject:instruction];
    
    AVAssetExportSession * exportSession = [[AVAssetExportSession alloc] initWithAsset:asset presetName:AVAssetExportPresetMediumQuality];
    
    CMTime start = CMTimeMakeWithSeconds(0, asset.duration.timescale);
    CMTime duration = CMTimeMakeWithSeconds(asset.duration.value / asset.duration.timescale, asset.duration.timescale);
    CMTimeRange range = CMTimeRangeMake(start, duration);
    exportSession.timeRange = range;
    
    [exportSession setVideoComposition:videoComposition];
    exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
    
    exportSession.outputFileType = AVFileTypeMPEG4;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^(void) {
        if (completionBlock) {
            completionBlock(exportSession.error);
        }
     }];
}

@end
