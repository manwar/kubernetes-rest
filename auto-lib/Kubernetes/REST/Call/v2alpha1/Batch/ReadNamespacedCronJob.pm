package Kubernetes::REST::Call::v2alpha1::Batch::ReadNamespacedCronJob;
  use Moo;
  use Types::Standard qw/Bool Str/;

  
  has exact => (is => 'ro', isa => Bool);
  
  has export => (is => 'ro', isa => Bool);
  
  has name => (is => 'ro', isa => Str,required => 1);
  
  has namespace => (is => 'ro', isa => Str,required => 1);
  
  has pretty => (is => 'ro', isa => Str);
  

  sub _url_params { [
  
    { name => 'name' },
  
    { name => 'namespace' },
  
  ] }

  sub _query_params { [
  
    { name => 'exact' },
  
    { name => 'export' },
  
    { name => 'pretty' },
  
  ] }

  sub _url { '/apis/batch/v2alpha1/namespaces/{namespace}/cronjobs/{name}' }
  sub _method { 'GET' }
1;
