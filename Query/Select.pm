package Wikibase::WQS::SPARQL::Query::Select;

use strict;
use warnings;

use Class::Utils qw(set_params);
use Error::Pure qw(err);

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub select_simple {
	my ($self, $property, $value) = @_;

	if ($property !~ m/^P\d+$/ms) {
		err "Bad property '$property'.";
	}

	my $sparql = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property '$value'
}
END

	return $sparql;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Wikibase::WQS::SPARQL::Query::Select - Simple SPARQL Wikibase select query.

=head1 SYNOPSIS

 use Wikibase::WQS::SPARQL::Query::Select;

 my $obj = Wikibase::WQS::SPARQL::Query::Select->new;
 my $sparql = $obj->select_simple($property, $value);

=head1 METHODS

=head2 C<new>

 my $obj = Wikibase::WQS::SPARQL::Query::Select->new;

Constructor.

Returns instance of class.

=head2 C<select_simple>

 my $sparql = $obj->select_simple($property, $value);

Construct SPARQL command and return it.

Returns string.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

 select_simple():
         Bad property '%s'.

=head1 EXAMPLE

 use strict;
 use warnings;

 use Wikibase::WQS::SPARQL::Query::Select;

 my $obj = Wikibase::WQS::SPARQL::Query::Select->new;

 my $property = 'P957';
 my $isbn = '80-239-7791-1';
 my $sparql = $obj->select_simple($property, $isbn);

 print "Property: $property\n";
 print "ISBN: $isbn\n";
 print "SPARQL:\n";
 print $sparql;

 # Output:
 # Property: P957
 # ISBN: 80-239-7791-1
 # SPARQL:
 # SELECT ?item WHERE {
 #   ?item wdt:P957 '80-239-7791-1'
 # }

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>.

=head1 SEE ALSO

=over

=item L<Wikibase::WQS::SPARQL::Query>

Useful Wikdata Query Service SPARQL queries.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Wikibase-WQS-SPARQL-Query>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020-2021

BSD 2-Clause License

=head1 VERSION

0.01

=cut
