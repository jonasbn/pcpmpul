package Perl::Critic::Policy::Modules::ProhibitUseLib;

# $Id$

use strict;
use warnings;
use base 'Perl::Critic::Policy';
use Perl::Critic::Utils qw{ :severities };
use version;

our $VERSION = '0.01';

Readonly::Scalar my $EXPL => q{Use PERL5INC environment instead};

use constant supported_parameters => ();
use constant default_severity     => $Perl::Critic::Utils::SEVERITY_MEDIUM;
use constant default_themes       => qw(dkhm);
use constant applies_to           => 'PPI::Statement::Include';

sub violates {
  my ($self, $elem, undef) = @_;

  my $child = $elem->schild(1);
  return if !$child;
  
  $child =~ m/\Alib\Z/ or return;

  return $self->violation
    ("Do not use 'use lib' statements",
     $EXPL,
     $child);
}

1;