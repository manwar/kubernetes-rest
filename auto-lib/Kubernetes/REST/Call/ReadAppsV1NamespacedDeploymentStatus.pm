package Kubernetes::REST::Call::ReadAppsV1NamespacedDeploymentStatus;
  use Moo;
  

  

  sub _url_params { [
  
  ] }

  sub _query_params { [
  
  ] }

  sub _url { '/apis/apps/v1/namespaces/{namespace}/deployments/{name}/status' }
  sub _method { 'GET' }
1;