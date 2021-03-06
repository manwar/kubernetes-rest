package Kubernetes::REST::Call::v1alpha1::RbacAuthorization::ReadClusterRoleBinding;
  use Moo;
  use Types::Standard qw/Str/;

  
  has name => (is => 'ro', isa => Str,required => 1);
  
  has pretty => (is => 'ro', isa => Str);
  

  sub _url_params { [
  
    { name => 'name' },
  
  ] }

  sub _query_params { [
  
    { name => 'pretty' },
  
  ] }

  sub _url { '/apis/rbac.authorization.k8s.io/v1alpha1/clusterrolebindings/{name}' }
  sub _method { 'GET' }
1;
