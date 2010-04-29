
# $Id$

use strict;
use warnings;
use Test::More qw(no_plan);

use_ok 'Perl::Critic::Policy::Modules::ProhibitUseLib';

require Perl::Critic;
my $critic = Perl::Critic->new
  ('-profile' => '',
   '-single-policy' => 'Modules::ProhibitUseLib');
{ my @p = $critic->policies;
  is (scalar @p, 1,
      'single policy ProhibitUseLib');

  my $policy = $p[0];
}

foreach my $data (
	[ 1, "use lib qw(/some/where)" ],
    [ 1, "use lib '/some/where/else'" ],
    [ 1, "use lib q{/some/where/else}" ],
    [ 1, "use lib qq{/some/where/else}" ],
    [ 0, "use library '/some/where/else'" ],
) {
  my ($want_count, $str) = @{$data};

  my @violations = $critic->critique (\$str);
  foreach (@violations) {
    diag ($_->description);
  }
  my $got_count = scalar @violations;
  is ($got_count, $want_count, "statement: $str");
}

exit 0;