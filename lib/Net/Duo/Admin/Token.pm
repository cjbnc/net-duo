# Representation of a single Duo token for the Admin API.
#
# This class wraps the Duo representation of a single Duo token, as returned
# by (for example) the Admin /tokens REST endpoint.

package Net::Duo::Admin::Token 1.00;

use 5.014;
use strict;
use warnings;

use parent qw(Net::Duo::Object);

use Net::Duo::Admin::User;

# Data specification for converting JSON into our object representation.  See
# the Net::Duo::Object documentation for syntax information.
sub fields {
    return {
        serial   => 'simple',
        token_id => 'simple',
        type     => 'simple',
        users    => 'Net::Duo::Admin::User',
    };
}

# Install our accessors.
Net::Duo::Admin::Token->install_accessors;

1;
__END__

=for stopwords
Allbery

=head1 NAME

Net::Duo::Admin::Token - Representation of a Duo token

=head1 SYNOPSIS

    my $token = Net::Duo::Admin::Token->new($decoded_json);
    say $token->serial;

=head1 DESCRIPTION

A Net::Duo::Admin::Token object is a Perl representation of a Duo token as
returned by the Duo Admin API, usually via the tokens() method or nested
in a user returned by the users() method.  It contains various information
about a token.

=head1 CLASS METHODS

=over 4

=item new(DUO, DATA)

Creates a new Net::Duo::Admin::Token object from a full data set.  DUO is
the Net::Duo object that should be used for any further actions on this
object.  DATA should be the data structure returned by the Duo REST API
for a single user, after JSON decoding.

=back

=head1 INSTANCE METHODS

=over 4

=item serial()

The serial number of the hardware token, used to uniquely identify the
hardware token when paired with type().

        serial   => 'simple',
        token_id => 'simple',
        type     => 'simple',
        users    => 'Net::Duo::Admin::User',

=item token_id()

The unique ID of this token as generated by Duo on token creation.

=item type()

The type of token.  For the list of valid values, see the Duo Admin API
documentation.

=item users()

The users associated with this token as a list of Net::Duo::Admin::User
objects.

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

L<Duo Admin API for tokens|https://www.duosecurity.com/docs/adminapi#tokens>

=cut