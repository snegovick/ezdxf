ezdxf DEBs
==========

Get DEB files at [releases page](https://github.com/snegovick/ezdxf/releases).

To build your own deb go to cloned repository and run:

'''
bash ./packaging/build_deb.sh
'''

Grab your package in deb\_dist.

ezdxf
=====

Abstract
--------

A Python package to create and modify DXF drawings, independent from the DXF
version. You can open/save every DXF file without losing any content (except comments),
Unknown tags in the DXF file will be ignored but preserved for saving. With this behavior
it is possible to open also DXF drawings that contains data from 3rd party applications.

Quick-Info
----------

- ezdxf is a Python package to create new DXF files and read/modify/write existing DXF files
- the intended audience are developers
- requires at least Python 3.6, for Python 3.5 use ezdxf < 0.11
- OS independent
- tested with CPython & PyPy on Windows 10 & Manjaro Linux
- additional required packages: [pyparsing](https://pypi.org/project/pyparsing/)
- MIT-License
- read/write/new support for DXF versions: R12, R2000, R2004, R2007, R2010, R2013 and R2018
- additional read support for DXF versions R13/R14 (upgraded to R2000)
- additional read support for older DXF versions than R12 (upgraded to R12)
- preserves third-party DXF content
- additional fast DXF R12 writer, that creates just an ENTITIES section with support for the basic DXF entities

A simple example:

```python
import ezdxf

# Create a new DXF document.
doc = ezdxf.new(dxfversion='R2010')

# Create new table entries (layers, linetypes, text styles, ...).
doc.layers.new('TEXTLAYER', dxfattribs={'color': 2})

# DXF entities (LINE, TEXT, ...) reside in a layout (modelspace, 
# paperspace layout or block definition).  
msp = doc.modelspace()

# Add entities to a layout by factory methods: layout.add_...() 
msp.add_line((0, 0), (10, 0), dxfattribs={'color': 7})
msp.add_text(
    'Test', 
    dxfattribs={
        'layer': 'TEXTLAYER'
    }).set_pos((0, 0.2), align='CENTER')

# Save DXF document.
doc.saveas('test.dxf')
```

Example for the *r12writer*, which writes a simple DXF R12 file without in-memory structures:

```python
from random import random
from ezdxf.r12writer import r12writer

MAX_X_COORD = 1000
MAX_Y_COORD = 1000

with r12writer("many_circles.dxf") as doc:
    for _ in range(100000):
        doc.add_circle((MAX_X_COORD*random(), MAX_Y_COORD*random()), radius=2)
```

The r12writer supports only the ENTITIES section of a DXF R12 drawing, no HEADER, TABLES or BLOCKS section is
present, except FIXED-TABLES are written, than some additional predefined text styles and line types are available.

Installation
------------

Install with pip for Python 3.6 and later:

    pip install ezdxf

Install with pip for Python 3.5, this version will get critical bug fixes:

    pip install ezdxf<0.11

Install latest development version with pip from GitHub:

    pip install git+https://github.com/mozman/ezdxf.git@master

or from source:

    python setup.py install

Website
-------

https://ezdxf.mozman.at/

Documentation
-------------

Documentation of development version at https://ezdxf.mozman.at/docs

Documentation of latest release at http://ezdxf.readthedocs.io/

Contribution
------------

The source code of *ezdxf* can be found at __GitHub__, target your pull requests to the `master` branch:

http://github.com/mozman/ezdxf.git


Feedback
--------

Questions and feedback at __Google Groups__:

https://groups.google.com/d/forum/python-ezdxf

python-ezdxf@googlegroups.com

Questions at __Stack Overflow__:

Post questions at [stack overflow](https://stackoverflow.com/) and use the tag `dxf` or `ezdxf`.

Issue tracker at __GitHub__:

http://github.com/mozman/ezdxf/issues

Contact
-------

Please post questions at the [forum](https://groups.google.com/d/forum/python-ezdxf) or 
[stack overflow](https://stackoverflow.com/) to make answers available to other users as well.

ezdxf@mozman.at

Feedback is greatly appreciated.

Manfred
