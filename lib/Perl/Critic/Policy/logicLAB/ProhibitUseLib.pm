package Perl::Critic::Policy::logicLAB::ProhibitUseLib;

# $Id$

use strict;
use warnings;
use base 'Perl::Critic::Policy';
use Perl::Critic::Utils qw{ $SEVERITY_MEDIUM };

our $VERSION = '0.01';

Readonly::Scalar my $EXPL => q{Use PERL5LIB environment instead};

use constant supported_parameters => ();
use constant default_severity     => $SEVERITY_MEDIUM;
use constant default_themes       => qw(maintenance);
use constant applies_to           => 'PPI::Statement::Include';

sub violates {
    my ( $self, $elem ) = @_;

    my $child = $elem->schild(1);    #second token
    return if !$child;    #return if no token, this will not be relevant to us

    #second token should read: lib
    #See t/test.t for examples of variations
    $child =~ m{
        \A  #beginning of string
        lib #the word 'lib'
        \Z  #end of string
    }xsm or return;

    return $self->violation( q{Do not use 'use lib' statements}, $EXPL,
        $child );
}

1;

__END__

=pod

=head1 NAME

Perl::Critic::Policy::logicLAB::ProhibitUseLib

=head1 SYNOPSIS

=head1 VERSION

This documentation describes version 0.01

=head1 DESCRIPTION

=head1 SUBROUTINES/METHODS

The 'use lib' statement, hardcodes the include path to be used. This can give
issues when moving logicLAB and scripts between diverse environments.

    use lib '/some/path';                                       #not ok
    use lib qw(/you/do/not/want/to/go/down/this/path /or/this); #not ok

Instead use the environment variable PERL5LIB

    #bash
    export PERL5LIB='/some/path/some/where'
    
    #tcsh and csh
    setenv PERL5LIB '/some/path/some/where'

=head1 DIAGNOSTICS

=head1 AFFILIATION

This policy is part of L<Perl::Critic::JONASBN> distribution.
    
=head1 CONFIGURATION AND ENVIRONMENT

This Policy is not configurable except for the standard options.
    
=head1 DEPENDENCIES AND REQUIREMENTS

Please see the specific policies.

=head1 INCOMPATIBILITIES

No known incompatibilities.

=head1 BUGS AND LIMITATIONS

=head1 BUG REPORTING

=head1 TEST AND QUALITY

=head2 TEST COVERAGE

    ---------------------------- ------ ------ ------ ------ ------ ------ ------
    File                           stmt   bran   cond    sub    pod   time  total
    ---------------------------- ------ ------ ------ ------ ------ ------ ------
    ...logicLAB/ProhibitUseLib.pm  100.0  100.0    n/a  100.0  100.0  100.0  100.0
    Total                         100.0  100.0    n/a  100.0  100.0  100.0  100.0
    ---------------------------- ------ ------ ------ ------ ------ ------ ------

=head1 TODO

=head1 SEE ALSO

=over

=item * L<http://perldoc.perl.org/perlrun.html#ENVIRONMENT>

=item * L<http://logiclab.jira.com/wiki/display/OPEN/Development#Development-MakeyourComponentsEnvironmentAgnostic>

=back

=head1 AUTHOR

=over

=item * Jonas B. Nielsen, jonasbn C<< <jonasbn@cpan.org> >>

=back

=head1 LICENSE AND COPYRIGHT

=cut
