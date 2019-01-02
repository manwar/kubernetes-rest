package Kubernetes::REST::Authorization;
  use Moo;
  use Kubernetes::REST::CallContext;

  has param_converter => (is => 'ro', required => 1);
  has io => (is => 'ro', required => 1);
  has result_parser => (is => 'ro', required => 1);
  has server => (is => 'ro', required => 1);
  has credentials => (is => 'ro', required => 1);
  has api_version => (is => 'ro', required => 1);

  sub _invoke_unversioned {
    my ($self, $method, $params) = @_;

    my $call = Kubernetes::REST::CallContext->new(
      method => $method,
      params => $params,
      server => $self->server,
      credentials => $self->credentials,
    );
    my $req = $self->param_converter->params2request($call);
    my $result = $self->io->call($call, $req);
    return $self->result_parser->result2return($call, $req, $result);
  }

  sub _invoke_versioned {
    my ($self, $method, $params) = @_;

    my $call = Kubernetes::REST::CallContext->new(
      method => $self->api_version . '::Authorization::' . $method,
      params => $params,
      server => $self->server,
      credentials => $self->credentials,
    );
    my $req = $self->param_converter->params2request($call);
    my $result = $self->io->call($call, $req);
    return $self->result_parser->result2return($call, $req, $result);
  }

  
  sub CreateNamespacedLocalSubjectAccessReview {
    my ($self, @params) = @_;
    $self->_invoke_versioned('CreateNamespacedLocalSubjectAccessReview', \@params);
  }
  
  sub CreateSelfSubjectAccessReview {
    my ($self, @params) = @_;
    $self->_invoke_versioned('CreateSelfSubjectAccessReview', \@params);
  }
  
  sub CreateSelfSubjectRulesReview {
    my ($self, @params) = @_;
    $self->_invoke_versioned('CreateSelfSubjectRulesReview', \@params);
  }
  
  sub CreateSubjectAccessReview {
    my ($self, @params) = @_;
    $self->_invoke_versioned('CreateSubjectAccessReview', \@params);
  }
  
  sub GetAPIResources {
    my ($self, @params) = @_;
    $self->_invoke_versioned('GetAPIResources', \@params);
  }
  
  sub GetAuthorizationAPIGroup {
    my ($self, @params) = @_;
    $self->_invoke_unversioned('GetAuthorizationAPIGroup', \@params);
  }
  
1;
