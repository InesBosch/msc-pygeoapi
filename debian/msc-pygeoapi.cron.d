# =================================================================
#
# Author: Tom Kralidis <tom.kralidis@canada.ca>
#
# Copyright (c) 2021 Tom Kralidis
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================

# every day at 0300h, clean bulletin records from ES
0 3 * * * geoadm msc-pygeoapi data bulletins_realtime clean_indexes --days 140 --yes

# every day at 0400h, clean hydrometric realtime data older than 30 days
0 4 * * * geoadm msc-pygeoapi data hydrometric_realtime clean_indexes --days 30 --yes

# every day at 0500h, clean swob realtime data older than 30 days
0 5 * * * geoadm msc-pygeoapi data swob_realtime clean_indexes --days 30 --yes

# every day at 0600h, clean aqhi realtime data older than 3 days
0 6 * * * geoadm msc-pygeoapi data aqhi_realtime clean_indexes --dataset all --days 3 --yes

# every day at 0300h, clean out empty MetPX directories
0 3 * * * geoadm /usr/bin/find $MSC_PYGEOAPI_CACHEDIR -type d -empty -delete > /dev/null 2>&1
