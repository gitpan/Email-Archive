#!/usr/bin/perl
use strict;
use warnings;
use Email::Simple;
use Email::Simple::Creator;

use Test::More;

use Email::Archive;

my $email = Email::Simple->create(
    header => [
      From    => 'foo@example.com',
      To      => 'drain@example.com',
      Subject => 'Message in a bottle',
      'Message-ID' => 'helloworld',
    ],
    body => 'hello there!'
);

my $e = Email::Archive->new();
$e->connect('dbi:SQLite:dbname=t/test.db');
print "sending @{[$email->as_string]}\n";
$e->store($email);

my $found = $e->retrieve('helloworld');
ok($found->header('subject') eq "Message in a bottle", "can find stored message by ID");

done_testing;
unlink 't/test.db';
