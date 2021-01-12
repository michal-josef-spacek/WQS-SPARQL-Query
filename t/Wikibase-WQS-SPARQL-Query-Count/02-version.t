use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::WQS::SPARQL::Query::Count;

# Test.
is($Wikibase::WQS::SPARQL::Query::Count::VERSION, undef, 'Version.');
