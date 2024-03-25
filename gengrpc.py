import os
while True:
    try:
        import requests
        from bs4 import BeautifulSoup as BS
    except ModuleNotFoundError as e:
        module = e.msg.split(' ')[-1]
        os.system(f'pip install {module}')
        continue
    break

def fetchversion():
    timeout = 30
    print('Fetching grpc version...')
    url = 'https://github.com/grpc/grpc/tags'
    try:
        resp = requests.get(url, timeout=timeout)
    except requests.exceptions.ConnectTimeout:
      print(f'{timeout}s timeout occurred,try again later')
      exit(1)
    content = resp.content
    root = BS(content, 'html.parser')

    for c in root.find_all('a'):
        href = c.get('href')
        if '/grpc/grpc/releases/tag/' in href:
            return href.replace('/grpc/grpc/releases/tag/', '').replace('/', '')
    return ''

version = fetchversion()
if not version:
    print('Failed to fetch version')
    exit(1)

cmd = f'''
git clone -b {version} https://github.com/grpc/grpc
cd grpc
git submodule update --init
mkdir -p cmake/build
cd cmake/build
cmake ../..
make protoc grpc_php_plugin

mv third_party/protobuf/protoc /usr/local/bin/
mv grpc_php_plugin /usr/local/bin/
'''
print(cmd)
