理解 pod 的删除过程
# 前言
本文主要介绍 pod 的删除过程，之前一直没仔细研究过，这次把整个过程记录下来

# pod 的删除过程

- 用 kubectl 删除 pod
- API server 更改 pod 状态为 Terminating
- kubelet 监听到这个状态更改，开始停止这个 pod 的过程
    - 如果有 preStop hook 的话，先运行这个 hook，如果 hook 在 terminationGracePeriodSeconds 之后还没运行完，kubelet 会给 pod 额外 2 秒的时间。
    - kubelet 让容器运行时发送 TERM 信号到每个容器中的进程 1。
- 当 pod 状态变为 Terminating 之后，pod 会从 Endpoints 下掉，
- terminationGracePeriodSeconds 过了之后，pod 里面的进程会收到 SIGKILL，kubelet 也会清理 pause 容器，如果有的话
- kubelet 把 terminationGracePeriodSeconds 改成了 0，强制从 API server 删除 pod 
- API server 删除 pod 

# PreStop hook
正常情况下 PreStop hook 运行完了，才会发送 TERM 信号。

# 链接
[Pod Lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/)
[Container Lifecycle Hooks](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/)
[Attach Handlers to Container Lifecycle Events](https://kubernetes.io/docs/tasks/configure-pod-container/attach-handler-lifecycle-event/#:~:text=Kubernetes%20sends%20the%20preStop%20event%20immediately%20before%20the,the%20preStop%20event%20when%20a%20Pod%20is%20terminated.)