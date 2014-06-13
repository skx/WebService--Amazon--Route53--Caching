#!/usr/bin/perl -Ilib/ -I../lib/ -w

use strict;
use warnings;

use Test::More qw! no_plan !;


BEGIN {use_ok('WebService::Amazon::Route53::Caching::Store::NOP');}
require_ok('WebService::Amazon::Route53::Caching::Store::NOP');
