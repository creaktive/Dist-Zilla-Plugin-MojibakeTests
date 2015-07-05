package Dist::Zilla::Plugin::MojibakeTests;
# ABSTRACT: Author tests for source encoding

use strict;
use warnings qw(all);

# VERSION

use Moose;
extends q(Dist::Zilla::Plugin::InlineFiles);
with 'Dist::Zilla::Role::PrereqSource';

sub register_prereqs {
    my $self = shift;
    $self->zilla->register_prereqs(
        {
            type  => 'requires',
            phase => 'develop',
        },
        'Test::Mojibake' => 0,
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

=pod

=head1 SYNOPSIS

In F<dist.ini>:

    [MojibakeTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the following file:

    xt/author/mojibake.t - a standard Test::Mojibake test

=for test_synopsis 1;
__END__

=cut

__DATA__
___[ xt/author/mojibake.t ]___
#!perl

use strict;
use warnings qw(all);

use Test::More;
use Test::Mojibake;

all_files_encoding_ok();
