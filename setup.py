from setuptools import setup

setup(
    name="opytrack",
    version='0.1.0',
    description="A project to find git information.",
    long_description="A project to find git information about authors' commits,most active days and time.",
    author="Helvecio L Neto",
    author_email="helvecio.neto@inpe.br",
    url="https://github.com/helvecioneto/opytrack",
    license="GPLv3+",
    py_modules=['opytrack'],
    install_requires=[
        'Click',
        'pygit2==0.24'
    ],
    entry_points='''
        [console_scripts]
        gitcen=gitcen:main
    ''',
    classifiers=(
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
        'Programming Language :: Python :: 3.6'
    )
)
