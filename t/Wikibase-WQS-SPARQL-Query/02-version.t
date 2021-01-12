use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::WQS::SPARQL::Query;

# Test.
is($Wikibase::WQS::SPARQL::Query::VERSION, 0.01, 'Version.');
