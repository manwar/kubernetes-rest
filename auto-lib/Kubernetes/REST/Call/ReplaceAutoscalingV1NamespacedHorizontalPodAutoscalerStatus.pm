package Kubernetes::REST::Call::ReplaceAutoscalingV1NamespacedHorizontalPodAutoscalerStatus;
  use Moo;
  use Types::Standard qw/Defined Str/;

  
  has body => (is => 'ro', isa => Defined,required => 1);
  
  has dryRun => (is => 'ro', isa => Str);
  
  has name => (is => 'ro', isa => Str,required => 1);
  
  has namespace => (is => 'ro', isa => Str,required => 1);
  
  has pretty => (is => 'ro', isa => Str);
  

  sub _url_params { [
  
    { name => 'name' },
  
    { name => 'namespace' },
  
  ] }

  sub _query_params { [
  
    { name => 'dryRun' },
  
    { name => 'pretty' },
  
  ] }

  sub _url { '/apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}/status' }
  sub _method { 'PUT' }
1;