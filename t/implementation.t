
# $Id$

use strict;
use  warnings;

use Test::More tests => 4;

use_ok('Perl::Critic::Policy::Modules::ProhibitUseLib');

ok(my $policy = Perl::Critic::Policy::Modules::ProhibitUseLib->new());

isa_ok($policy, 'Perl::Critic::Policy::Modules::ProhibitUseLib');

can_ok($policy, qw(violates));
