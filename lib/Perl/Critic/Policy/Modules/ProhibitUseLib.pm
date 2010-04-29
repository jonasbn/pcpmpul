package Perl::Critic::Policy::Modules::ProhibitUseLib;

# $Id$

use strict;
use warnings;
use base 'Perl::Critic::Policy';
use Perl::Critic::Utils qw{ $SEVERITY_MEDIUM };
use version;

our $VERSION = '0.01';

Readonly::Scalar my $EXPL => q{Use PERL5INC environment instead};

use constant supported_parameters => ();
use constant default_severity     => $SEVERITY_MEDIUM;
use constant default_themes       => qw(bugs);
use constant applies_to           => 'PPI::Statement::Include';

sub violates {
    my ( $self, $elem ) = @_;

    my $child = $elem->schild(1);    #second token
    return if !$child;    #return if no token, this will not be relevant to us

    #second token should read: lib
    #See t/test.t for examples of variations
    $child =~ m/\Alib\Z/ or return;

    return $self->violation( q{Do not use 'use lib' statements}, $EXPL,
        $child );
}

1;
