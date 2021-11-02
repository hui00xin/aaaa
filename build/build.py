#!/usr/bin/env python3

import os, sys, argparse, datetime, subprocess
from os.path import expanduser

from support import *

info(f'check {builddir}/pom.xml...')
apps = parsePOM()
info(f'set apps=[%s]' % ', '.join(apps))

def main():
    parser = argparse.ArgumentParser(description='build crypto exchange')
    parser.add_argument('--checkjavaversion', default='true', help='skip check java version')
    args = parser.parse_args()

    # init snapshot dir:
    snapshotdir = os.path.join(builddir, 'release', 'snapshot')
    run(f'mkdir -p {snapshotdir}')
    info(f'set snapshotdir={snapshotdir}')

    if args.checkjavaversion == 'true':
        info('check java version...')
        run('sh build/check-java-version.sh')

    info('build java projects...')
    run('mvn -DskipTests -Dcheckstyle.skip clean package', builddir)

    info(f'copy jars to {snapshotdir}/target...')
    run(f'mkdir -p {snapshotdir}/target')
    for app in apps:
        jarfile = f'{basedir}/{app}/target/crypto-{app}.jar'
        if os.path.isfile(jarfile):
            run(f'cp {jarfile} {snapshotdir}/target')

    info(f'copy config-repo to {snapshotdir}...')
    run(f'cp -r {basedir}/config-repo {snapshotdir}')

    if 'ui' in apps:
        resourcedir = os.path.join(basedir, 'ui', 'src', 'main', 'resources')
        info(f'gzip static resources to {snapshotdir}/target/resources.tar.gz...')
        run(f'tar --exclude ".*" -czvf {snapshotdir}/target/resources.tar.gz favicon.ico robots.txt static/', resourcedir)

    info(f'build ok and saved in {snapshotdir}.')

if __name__ == '__main__':
    main()
