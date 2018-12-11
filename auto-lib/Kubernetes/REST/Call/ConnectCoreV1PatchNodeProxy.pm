package Kubernetes::REST::Call::ConnectCoreV1PatchNodeProxy;
  use Moo;
  use Types::Standard qw/Str/;

  
  has name => (is => 'ro', isa => Str,required => 1);
  
  has path => (is => 'ro', isa => Str);
  

  sub _url_params { [
  
    { name => 'name' },
  
  ] }

  sub _query_params { [
  
    { name => 'path' },
  
  ] }

  sub _url { '/api/v1/nodes/{name}/proxy' }
  sub _method { 'PATCH' }
1;
