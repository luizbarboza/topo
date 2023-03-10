/// TopoJSON is an extension of GeoJSON that encodes topology and eliminates
/// redundancy.
///
/// Rather than representing geometries discretely, geometries in TopoJSON files
/// are stitched together from shared line segments called *arcs*. This
/// technique is similar to
/// [Matt Bloch’s MapShaper](http://www.cartogis.org/docs/proceedings/2006/bloch_harrower.pdf)
/// and the
/// [Arc/Info Export format, .e00](https://web.archive.org/web/20140721114041/http://indiemaps.com:80/blog/2009/02/e00parser-an-actionscript-3-parser-for-the-arcinfo-export-topological-gis-format/).
///
/// TopoJSON eliminates redundancy, allowing related geometries to be stored
/// efficiently in the same file. For example, the shared boundary between
/// California and Nevada is represented only once, rather than being duplicated
/// for both states. A single TopoJSON file can contain multiple feature
/// collections without duplication, such as states and counties. Or, a TopoJSON
/// file can efficiently represent both polygons (for fill) and boundaries (for
/// stroke) as two feature collections that share the same arc mesh. See
/// [How To Infer Topology](https://bost.ocks.org/mike/topology/) for a visual
/// explanation of how TopoJSON works. See
/// [Command-Line Cartography](https://medium.com/@mbostock/command-line-cartography-part-1-897aa8f8ca2c)
/// for an introduction to TopoJSON and related tools. See
/// [TopoJSON Format Specification](https://github.com/topojson/topojson-specification)
/// for the format specification.
///
/// To further reduce file size, TopoJSON can use quantized delta-encoding for
/// integer coordinates. This is similar to rounding coordinate values (e.g.,
/// [LilJSON](https://github.com/migurski/LilJSON)), but with greater efficiency
/// and control over loss of information. And like GeoJSON, TopoJSON files are
/// easily modified in a text editor and amenable to gzip compression.
///
/// As a result, TopoJSON is substantially more compact than GeoJSON, frequently
/// offering a reduction of 80% or more even without simplification. Yet
/// encoding topology also has numerous useful applications for maps and
/// visualization above! It allows
/// [topology-preserving shape simplification](https://pub.dev/packages/topo_simplify),
/// which ensures that adjacent features remain connected after simplification;
/// this applies even across feature collections, such as simultaneous
/// consistent simplification of state and county boundaries. Topology can also
/// be used for
/// [Dorling](http://www.ncgia.ucsb.edu/projects/Cartogram_Central/types.html)
/// or
/// [hexagonal cartograms](http://pitchinteractive.com/latest/tilegrams-more-human-maps/),
/// as well as other techniques that need shared boundary information such as
/// [automatic map coloring](https://bl.ocks.org/4188334).
export 'src/topo.dart';
