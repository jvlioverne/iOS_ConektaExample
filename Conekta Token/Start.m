//
//  ViewController.m
//  Conekta Token
//
//  Created by Benjas on 04/12/15.
//  Copyright © 2015 Benjas. All rights reserved.
//

#import "Start.h"
#import "Conekta.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    Conekta *conekta = [[Conekta alloc] init];
    
    [conekta setDelegate: self];
    
    [conekta setPublicKey:@"key_JrzczttsDKPu4qcixYTxZrw"];
    
    [conekta collectDevice];
    
    Card *card = [conekta.Card initWithNumber: @"4242424242424242" name: @"Julian Ceballos" cvc: @"123" expMonth: @"10" expYear: @"2018"];
    
    Token *token = [conekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        NSLog(@"%@", data);
    } andError: ^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
