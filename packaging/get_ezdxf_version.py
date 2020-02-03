def get_version():
    v = {}
    for line in open('./src/ezdxf/version.py').readlines():
        if line.strip().startswith('__version__'):
            exec(line, v)
            return v['__version__']
    raise IOError('__version__ string not found')

print(get_version())
