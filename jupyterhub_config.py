# Add:
# 根据 proxy 所在实际位置调整代理命令
c.JupyterHub.proxy_cmd = ['configurable-http-proxy']

# 修改默认端口，防止冲突
c.JupyterHub.hub_port = 38081

# 指定可以访问的用户
# c.Authenticator.allowed_users = {''}

# 设置工作目录
c.Spawner.notebook_dir = '/data'

# 外部监听 IP 及 port
c.Spawner.ip = '0.0.0.0'
c.JupyterHub.port = 38888

c.Spawner.default_url = '/lab'
c.Spawner.cmd = ['jupyter-labhub']
