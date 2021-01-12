use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::WQS::SPARQL::Query::Select;

# Test.
my $obj = Wikibase::WQS::SPARQL::Query::Select->new;
isa_ok($obj, 'Wikibase::WQS::SPARQL::Query::Select');
