use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::WQS::SPARQL::Query::Select;

# Test.
is($Wikibase::WQS::SPARQL::Query::Select::VERSION, undef, 'Version.');
