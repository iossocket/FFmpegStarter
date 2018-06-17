//
//  ViewController.m
//  FFmpegStarter
//
//  Created by XueliangZhu on 6/16/18.
//  Copyright © 2018 iossocket. All rights reserved.
//

#import "ViewController.h"
#import "CommonUtils.h"

#import "avformat.h"
#import "swscale.h"
#import "swresample.h"
#import "pixdesc.h"

@interface ViewController () {
    AVStream *_videoStream;
    AVStream *_audioStream;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerFFmpeg];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self openFile];
}

- (void)registerFFmpeg {
    avformat_network_init();
    av_register_all();
}

- (void)openFile {
    AVFormatContext *formatContext = avformat_alloc_context();
    NSString *filePath = [CommonUtils bundlePath:@"test.flv"];
    
    int result = avformat_open_input(&formatContext, [filePath cStringUsingEncoding:NSUTF8StringEncoding], NULL, NULL);
    if (result == 0) {
        avformat_find_stream_info(formatContext, NULL);
        for (int i = 0; i < formatContext->nb_streams; i++) {
            AVStream *stream = formatContext->streams[i];
            if (stream->codecpar->codec_type == AVMEDIA_TYPE_VIDEO) {
                NSLog(@"this is video stream");
                _videoStream = stream;
            } else if (stream->codecpar->codec_type == AVMEDIA_TYPE_AUDIO) {
                NSLog(@"this is audio stream");
                _audioStream = stream;
            } else if (stream->codecpar->codec_type == AVMEDIA_TYPE_SUBTITLE) {
                NSLog(@"this is subtitle stream");
            }
        }
    }
    
    AVCodecContext *audioCodecCtx = _audioStream->codecpar;
}

@end
