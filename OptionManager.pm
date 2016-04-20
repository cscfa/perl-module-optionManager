package OptionManager;

use Getopt::Long qw/GetOptionsFromArray :config pass_through/;

my @baseArgv;

BEGIN
{
	@baseArgv = @ARGV;
}

sub new
{
	my $class = shift;
	my ($args) = @_;
	
	my $self = bless {}, $class;
	
	foreach my $argKey (keys(%{$args})) {
		$self->{$argKey} = $args->{$argKey};
	}
	
	return $self;
}

sub _getArgv
{
	my $self = shift;
	
	return @baseArgv;
}

sub getOption
{
	my $self = shift;
	my $option = shift;
	my $default = shift;
	
	my $result = undef;
	my @arg = $self->_getArgv();
	GetOptionsFromArray(\@arg, $option => \$result);
	
 	$result = $result || $default if (defined $default);
	return $result;
}

1;
__END__