// @apiVersion 0.1
// @name io.ksonnet.pkg.iap-ingress
// @description Provides ingress prototypes for setting up IAP on GKE.
// @shortDescription Ingress for IAP on GKE.
// @param name string Name for the component
// @optionalParam namespace string default Namespace
// @optionalParam secretName string envoy-ingress-tls The name of the secret containing the SSL certificates.
// @param ipName string The name of the global ip address to use.
// @optionalParam hostname string null The hostname associated with this ingress. Eg: mykubeflow.example.com
// @optionalParam issuer string letsencrypt-prod The cert-manager issuer name.

// TODO(https://github.com/ksonnet/ksonnet/issues/222): We have to add namespace as an explicit parameter
// because ksonnet doesn't support inheriting it from the environment yet.

local k = import "k.libsonnet";
local iap = import "kubeflow/core/iap.libsonnet";

local name = import "param://name";
local namespace = import "param://namespace";
local secretName = import "param://secretName";
local ipName = import "param://ipName";
local hostname = import "param://hostname";
local issuer = import "param://issuer";

iap.parts(namespace).ingressParts(secretName, ipName, hostname, issuer)
