[![pub package](https://img.shields.io/pub/v/topo.svg)](https://pub.dev/packages/topo)
[![package publisher](https://img.shields.io/pub/publisher/topo.svg)](https://pub.dev/packages/topo/publisher)

TopoJSON is an extension of GeoJSON that encodes topology and eliminates
redundancy.

Rather than representing geometries discretely, geometries in TopoJSON files
are stitched together from shared line segments called *arcs*. This
technique is similar to
[Matt Bloch’s MapShaper](https://cartogis.org/docs/proceedings/2006/bloch_harrower.pdf)
and the
[Arc/Info Export format, .e00](https://indiemaps.com/blog/2009/02/e00parser-an-actionscript-3-parser-for-the-arcinfo-export-topological-gis-format/).

TopoJSON eliminates redundancy, allowing related geometries to be stored
efficiently in the same file. For example, the shared boundary between
California and Nevada is represented only once, rather than being duplicated
for both states. A single TopoJSON file can contain multiple feature
collections without duplication, such as states and counties. Or, a TopoJSON
file can efficiently represent both polygons (for fill) and boundaries (for
stroke) as two feature collections that share the same arc mesh. See
[How To Infer Topology](https://bost.ocks.org/mike/topology/) for a visual
explanation of how TopoJSON works. See
[Command-Line Cartography](https://medium.com/@mbostock/command-line-cartography-part-1-897aa8f8ca2c)
for an introduction to TopoJSON and related tools. See
[TopoJSON Format Specification](https://github.com/topojson/topojson-specification)
for the format specification.

To further reduce file size, TopoJSON can use quantized delta-encoding for
integer coordinates. This is similar to rounding coordinate values (e.g.,
[LilJSON](https://github.com/migurski/LilJSON)), but with greater efficiency
and control over loss of information. And like GeoJSON, TopoJSON files are
easily modified in a text editor and amenable to gzip compression.

As a result, TopoJSON is substantially more compact than GeoJSON, frequently
offering a reduction of 80% or more even without simplification. Yet
encoding topology also has numerous useful applications for maps and
visualization above! It allows
[topology-preserving shape simplification](https://pub.dev/packages/topo_simplify),
which ensures that adjacent features remain connected after simplification;
this applies even across feature collections, such as simultaneous
consistent simplification of state and county boundaries. Topology can also
be used for
[Dorling](https://www.ncgia.ucsb.edu/projects/Cartogram_Central/types.html)
or
[hexagonal cartograms](https://pitchinteractive.com/latest/tilegrams-more-human-maps/),
as well as other techniques that need shared boundary information such as
[automatic map coloring](https://bl.ocks.org/4188334).

## API Reference

### [Generation (topo_server)](https://pub.dev/documentation/topo_server/latest/)

* [topojson.topology](https://pub.dev/documentation/topo_server/latest/topo_server/topology.html) - convert GeoJSON to TopoJSON.

### [Simplification (topo_simplify)](https://pub.dev/documentation/topo_simplify/latest/)

* [topojson.presimplify](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/presimplify.html) - prepare TopoJSON for simplification.
* [topojson.simplify](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/simplify.html) - simplify geometry by removing coordinates.
* [topojson.quantile](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/quantile.html) - compute a simplification threshold.
* [topojson.filter](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/filter.html) - remove rings from a topology.
* [topojson.filterAttached](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/filterAttached.html) - remove detached rings.
* [topojson.filterAttachedWeight](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/filterAttachedWeight.html) - remove small detached rings.
* [topojson.filterWeight](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/filterWeight.html) - remove small rings.
* [topojson.planarRingArea](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/planarRingArea.html) - compute the planar area of a ring.
* [topojson.planarTriangleArea](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/planarTriangleArea.html) - compute the planar area of a triangle.
* [topojson.sphericalRingArea](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/sphericalRingArea.html) - compute the spherical area of a ring.
* [topojson.sphericalTriangleArea](https://pub.dev/documentation/topo_simplify/latest/topo_simplify/sphericalTriangleArea.html) - compute the spherical area of a triangle.

### [Manipulation (topo_client)](https://pub.dev/documentation/topo_client/latest/)

* [topojson.feature](https://pub.dev/documentation/topo_client/latest/topo_client/feature.html) - convert TopoJSON to GeoJSON.
* [topojson.merge](https://pub.dev/documentation/topo_client/latest/topo_client/merge.html) - merge TopoJSON geometry and convert to GeoJSON polygons.
* [topojson.mergeArcs](https://pub.dev/documentation/topo_client/latest/topo_client/mergeArcs.html) - merge TopoJSON geometry to form polygons.
* [topojson.mesh](https://pub.dev/documentation/topo_client/latest/topo_client/mesh.html) - mesh TopoJSON geometry and convert to GeoJSON lines.
* [topojson.meshArcs](https://pub.dev/documentation/topo_client/latest/topo_client/meshArcs.html) - mesh TopoJSON geometry to form lines.
* [topojson.neighbors](https://pub.dev/documentation/topo_client/latest/topo_client/neighbors.html) - compute adjacent features.
* [topojson.bbox](https://pub.dev/documentation/topo_client/latest/topo_client/bbox.html) - compute the bounding box of a topology.
* [topojson.quantize](https://pub.dev/documentation/topo_client/latest/topo_client/quantize.html) - round coordinates, reducing precision.
* [topojson.transformPoint](https://pub.dev/documentation/topo_client/latest/topo_client/pointTransform.html) - remove delta-encoding and apply a transform.
* [topojson.untransformPoint](https://pub.dev/documentation/topo_client/latest/topo_client/untransformPoint.html) - apply delta-encoding and remove a transform.