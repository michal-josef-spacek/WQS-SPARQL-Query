package WQS::SPARQL::Query::Select;

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

sub select_value {
	my ($self, $property_pairs_hr) = @_;

	foreach my $property (keys %{$property_pairs_hr}) {
		if ($property !~ m/^P\d+$/ms) {
			err "Bad property '$property'.";
		}
	}

	my $sparql = "SELECT ?item WHERE {\n";
	foreach my $property (sort keys %{$property_pairs_hr}) {
		my $value = $property_pairs_hr->{$property};
		if ($value =~ m/^Q\d+$/ms) {
			$value = "wd:$value";
		} else {
			$value = "'$value'";
		}
		$sparql .= "  ?item wdt:$property $value.\n"
	}
	$sparql .= "}\n";

	return $sparql;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

WQS::SPARQL::Query::Select - Simple SPARQL select query.

=head1 SYNOPSIS

 use WQS::SPARQL::Query::Select;

 my $obj = WQS::SPARQL::Query::Select->new;
 my $sparql = $obj->select_value($property_pairs_hr);

=head1 METHODS

=head2 C<new>

 my $obj = WQS::SPARQL::Query::Select->new;

Constructor.

Returns instance of class.

=head2 C<select_value>

 my $sparql = $obj->select_value($property_pairs_hr);

Construct SPARQL command and return it.
Input is reference to hash with pairs property => value.

Returns string.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

 select_value():
         Bad property '%s'.

=head1 EXAMPLE

 use strict;
 use warnings;

 use WQS::SPARQL::Query::Select;

 my $obj = WQS::SPARQL::Query::Select->new;

 my $property = 'P957';
 my $isbn = '80-239-7791-1';
 my $sparql = $obj->select_value({$property => $isbn});

 print "Property: $property\n";
 print "ISBN: $isbn\n";
 print "SPARQL:\n";
 print $sparql;

 # Output:
 # Property: P957
 # ISBN: 80-239-7791-1
 # SPARQL:
 # SELECT ?item WHERE {
 #   ?item wdt:P957 '80-239-7791-1'.
 # }

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>.

=head1 SEE ALSO

=over

=item L<WQS::SPARQL::Query>

Useful Wikdata Query Service SPARQL queries.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/WQS-SPARQL-Query>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2020-2021

BSD 2-Clause License

=head1 VERSION

0.01

=cut
