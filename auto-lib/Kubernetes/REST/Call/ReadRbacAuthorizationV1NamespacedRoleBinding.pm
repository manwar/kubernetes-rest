package Kubernetes::REST::Call::ReadRbacAuthorizationV1NamespacedRoleBinding;
  use Moo;
  

  

  sub _url_params { [
  
  ] }

  sub _query_params { [
  
  ] }

  sub _url { '/apis/rbac.authorization.k8s.io/v1/namespaces/{namespace}/rolebindings/{name}' }
  sub _method { 'GET' }
1;