package Kubernetes::REST::Call::WatchStorageV1StorageClassList;
  use Moo;
  use Types::Standard qw/Bool Int Str/;

  
  has continue => (is => 'ro', isa => Str);
  
  has fieldSelector => (is => 'ro', isa => Str);
  
  has includeUninitialized => (is => 'ro', isa => Bool);
  
  has labelSelector => (is => 'ro', isa => Str);
  
  has limit => (is => 'ro', isa => Int);
  
  has pretty => (is => 'ro', isa => Str);
  
  has resourceVersion => (is => 'ro', isa => Str);
  
  has timeoutSeconds => (is => 'ro', isa => Int);
  
  has watch => (is => 'ro', isa => Bool);
  

  sub _url_params { [
  
  ] }

  sub _query_params { [
  
    { name => 'continue' },
  
    { name => 'fieldSelector' },
  
    { name => 'includeUninitialized' },
  
    { name => 'labelSelector' },
  
    { name => 'limit' },
  
    { name => 'pretty' },
  
    { name => 'resourceVersion' },
  
    { name => 'timeoutSeconds' },
  
    { name => 'watch' },
  
  ] }

  sub _url { '/apis/storage.k8s.io/v1/watch/storageclasses' }
  sub _method { 'GET' }
1;
