package Kubernetes::REST::Result2Object;
  use Moo;
  use IO::K8s;
  use Kubernetes::REST::Error;

  has parser => (is => 'ro', default => sub { IO::K8s->new });

  sub result2return {
    my ($self, $call, $req, $response) = @_;

    if ($response->status >= 400) {
      return $self->process_error($response);
    } else {
      return 1 if (not defined $response->content);
      return $self->process_response($response);
    } 
  }

  sub process_response {
    my ($self, $response) = @_;
    
    my $object = eval {
      $self->parser->json_to_object("", $response->content);
    };
    Kubernetes::REST::Error->throw(
      type => 'UnparseableResponse',
      message => 'Can\'t parse response ' . $response->content . ' with error ' . $@
    ) if ($@);

    return $object;
  }

  sub process_error {
    my ($self, $response) = @_;

    my $struct = eval {
      $self->parser->decode($response->content);
    };

    Kubernetes::REST::Error->throw(
      type => 'UnparseableResponse',
      message => 'Can\'t parse JSON content',
      detail => $response->content,
    ) if ($@);

    # Throw a Kubernetes::REST::RemoteError exception from
    # the info in $struct
    # {"kind":"Status","apiVersion":"v1","metadata":{},"status":"Failure","message":"Unauthorized","reason":"Unauthorized","code":401}
    Kubernetes::REST::RemoteError->throw(
      status => $response->status,
      type => 'RemoteError',
      message => "$struct->{ message }: $struct->{ reason }",
    );
  }

1;
