package Kubernetes::REST::Call::ReadAppsV1beta2NamespacedDeploymentStatus;
  use Moo;
  use Types::Standard qw/Str/;

  
  has name => (is => 'ro', isa => Str,required => 1);
  
  has namespace => (is => 'ro', isa => Str,required => 1);
  
  has pretty => (is => 'ro', isa => Str);
  

  sub _url_params { [
  
    { name => 'name' },
  
    { name => 'namespace' },
  
  ] }

  sub _query_params { [
  
    { name => 'pretty' },
  
  ] }

  sub _url { '/apis/apps/v1beta2/namespaces/{namespace}/deployments/{name}/status' }
  sub _method { 'GET' }
1;
