# Local Kubernetes Setup

## Chowny's Suggestions
1. If you're going to do K8S, do it up proper - run a multi-node cluster so that you're not under any delusions of simplicity and narrowed scope. K8S is amazing, but you really need to be ready for it.
1. Once you've deployed K8S locally via one of the hereafter documented options, you should consider deploying something to it. A reasonable choice is the [Kubernetes example Guestbook app](https://github.com/kubernetes/kubernetes/tree/release-1.5/examples/guestbook).

## Deployment Types
There are a couple of ways to get local K8S running:
1. [Single-node](#single-node-options) (Master, Etcd, and Nodes all reside in a single VM)
1. [Multi-node](#multi-node-options) (Separate VMs for each role, multiples of each if you wish)

## Single-node Options
1. [minikube](#minikube) ([docs](https://kubernetes.io/docs/getting-started-guides/minikube/))

## Multi-node Options
1. [CoreOS Multi-node: Vagrant](#coreos-multi-node-vagrant) ([docs](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html))
1. [nkube](#nkube) ([github](https://github.com/marun/nkube)) -- Each "node" runs as a Docker container which itself runs docker.

### CoreOS Multi-node: Vagrant
_(Notes last updated: 7/13/2017)_

Generally, the steps given in the linked [documentation](https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant.html) will get you 99% of the way there. There is one small bit that might throw you for a loop, regardless of the manner in which you setup your local `kubectl` config - the dashboard URL returned by `kubectl cluster-info` will yield `Unauthorized` until you run something like the following:

`kubectl proxy --address="0.0.0.0" --port=9090`

Now you should be able to hit `localhost:9090` and see an index of paths you can navigate, one of which is `/ui`. So you should be able to see the dashboard at `http://localhost:9090/ui`. Enjoy!

### minikube
_(Notes last updated: 7/13/2017)_

Minikube can be deployed in lots of places on a handful of hypervisors, which makes it pretty versatile in terms of workstation deployment targets.

The linked [docs](https://kubernetes.io/docs/getting-started-guides/minikube/) are pretty solid in terms of getting things to work without _too_ much hassle. That said, the documentation feels disjointed in some ways. Anyway, minikube generally "just works", but it tends to rely on the `minikube` command for most tasks (deploying stuff, exposing ports, etc), mostly for the sake of consolidating commands and hiding the work from the user. This is fine for a quick hack session, but if you want to actually figure out what K8S is doing behind the scenes and what is needed to actually do these things in a non-playground environment, you're best to avoid the "magic" of the `minikube` command.

One other small annoyance (to me) is that minkube runs a BusyBox VM, which is, quite simply, a royal pain in the neck. This may be an Ops-centric complaint, as I like to install lots of tools to inspect traffic and other bits of host behavior, and this is _incredibly_ frustrating (if not downright impossible) inside BusyBox. Given that this is a distribution that's primarily intended to be used in embedded environments, it seems a very odd choice for a local K8S environment.
