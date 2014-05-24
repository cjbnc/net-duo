# Representation of a single Duo user for the Admin API.
#
# This class wraps the Duo representation of a single Duo user, as returned by
# (for example) the Admin /users REST endpoint.

package Net::Duo::Admin::User 1.00;

use 5.014;
use strict;
use warnings;

use parent qw(Net::Duo::Object);

use Net::Duo::Admin::Group;
use Net::Duo::Admin::Phone;
use Net::Duo::Admin::Token;

# Data specification for converting JSON into our object representation.  See
# the Net::Duo::Object documentation for syntax information.
sub fields {
    return {
        user_id    => 'simple',
        username   => 'simple',
        realname   => 'simple',
        email      => 'simple',
        status     => 'simple',
        groups     => 'Net::Duo::Admin::Group',
        last_login => 'nullable',
        notes      => 'simple',
        phones     => 'Net::Duo::Admin::Phone',
        tokens     => 'Net::Duo::Admin::Token',
    };
}

# Install our accessors.
Net::Duo::Admin::User->install_accessors;

1;
__END__

=for stopwords
Allbery

=head1 NAME

Net::Duo::Admin::User - Representation of a Duo user

=head1 SYNOPSIS

    my $user = Net::Duo::Admin::User->new($decoded_json);
    say $user->realname;

=head1 DESCRIPTION

A Net::Duo::Admin::User object is a Perl representation of a Duo user as
returned by the Duo Admin API, usually via the users() method.  It contains
various information about the user, including their groups, phones, and
tokens.

=head1 CLASS METHODS

=over 4

=item new(DUO, DATA)

Creates a new Net::Duo::Admin::User object from a full data set.  DUO is
the Net::Duo object that should be used for any further actions on this
object.  DATA should be the data structure returned by the Duo REST API
for a single user, after JSON decoding.

=back

=head1 INSTANCE METHODS

=over 4

=item email()

The user's email address.

=item groups()

List of groups to which this user belongs, as Net::Duo::Admin::Group
objects.

=item last_login()

The last time this user logged in, as a UNIX timestamp, or undef if the
user has not logged in.

=item notes()

Notes about this user.

=item phones()

List of phones this user can use, as Net::Duo::Admin::Phone objects.

=item realname()

The user's real name.

=item status()

One of the following values:

=over 4

=item C<active>

The user must complete secondary authentication.

=item C<bypass>

The user will bypass secondary authentication after completing primary
authentication.

=item C<disabled>

The user will not be able to log in.

=item C<locked out>

The user has been automatically locked out due to excessive authentication
attempts.

=back

=item tokens()

List of tokens this user can use, as Net::Duo::Admin::Token objects.

=item user_id()

The unique ID of this user as generated by Duo on user creation.

=item username()

The username of this user.

=back

=head1 AUTHOR

Russ Allbery <rra@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2014 The Board of Trustees of the Leland Stanford Junior
University

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

=head1 SEE ALSO

L<Net::Duo::Admin>

L<Duo Admin API for users|https://www.duosecurity.com/docs/adminapi#users>

=cut
