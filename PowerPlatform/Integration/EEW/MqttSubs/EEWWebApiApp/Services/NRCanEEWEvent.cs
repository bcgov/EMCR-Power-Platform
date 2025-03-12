using System;
using System.Collections.Generic;
using System.Linq;

public class EventMessage
{
    public string version { get; set; }
    public string orig_sys { get; set; }
    public string message_type { get; set; }
    public DateTime timestamp { get; set; }
    public string category { get; set; }
    public string alg_vers { get; set; }
    public string instance { get; set; }
    public string ref_id { get; set; }
    public string ref_src { get; set; }
    public CoreInfo core_info { get; set; }
    public Contributors contributors { get; set; }
    public FaultInfo fault_info { get; set; }
    public GmInfo gm_info { get; set; }
}

public class CoreInfo
{
    public string id { get; set; }
    public decimal mag { get; set; }
    public decimal mag_uncer { get; set; }
    public decimal lat { get; set; }
    public decimal lat_uncer { get; set; }
    public decimal lon { get; set; }
    public decimal lon_uncer { get; set; }
    public decimal depth { get; set; }
    public decimal depth_uncer { get; set; }
    public DateTime orig_time { get; set; }
    public decimal orig_time_uncer { get; set; }
    public decimal likelihood { get; set; }
    public int num_stations { get; set; }
}

public class Contributors
{
    public Contributor contributor { get; set; }
}

public class Contributor
{
    public string alg_instance { get; set; }
    public string alg_name { get; set; }
    public string alg_version { get; set; }
    public string category { get; set; }
    public string event_id { get; set; }
    public string version { get; set; }
}

public class FaultInfo
{
    public FiniteFault finite_fault { get; set; }
}

public class FiniteFault
{
    public bool atten_geom { get; set; }
    public int segment_number { get; set; }
    public string segment_shape { get; set; }
    public List<Segment> segment { get; set; }
}

public class Segment
{
    public List<Vertex> vertices { get; set; }
}

public class Vertex
{
    public decimal lat { get; set; }
    public decimal lon { get; set; }
    public decimal depth { get; set; }
}

public class GmInfo
{
    public GmcontourPred gmcontour_pred { get; set; }
    public GmpointObs gmpoint_obs { get; set; }
}

public class GmcontourPred
{
    public List<Contour> contour { get; set; }
}

public class Contour
{
    public decimal MMI { get; set; }
    public decimal PGA { get; set; }
    public decimal PGV { get; set; }
    public string polygon { get; set; }
}

public class GmpointObs
{
    public List<PgvObs> pgv_obs { get; set; }
    public List<PgaObs> pga_obs { get; set; }
}

public class PgvObs
{
    public string SNCL { get; set; }
    public decimal value { get; set; }
    public decimal lat { get; set; }
    public decimal lon { get; set; }
    public DateTime time { get; set; }
}

public class PgaObs
{
    public string SNCL { get; set; }
    public decimal value { get; set; }
    public decimal lat { get; set; }
    public decimal lon { get; set; }
    public DateTime time { get; set; }
}

public class SampleDataGenerator
{
    private static Random _random = new Random();

    // Method to generate sample data based on user input
    public EventMessage GenerateSampleData(decimal magnitude, decimal centerLat, decimal centerLon)
    {
        // Generate the core information based on the magnitude and center coordinates
        var coreInfo = new CoreInfo
        {
            id = "MaRiver" + magnitude,
            mag = magnitude,
            mag_uncer = 0.5m,  // Example uncertainty for magnitude
            lat = centerLat,
            lat_uncer = 0.25m,  // Example uncertainty for latitude
            lon = centerLon,
            lon_uncer = 0.25m,  // Example uncertainty for longitude
            depth = 10.0m,
            depth_uncer = 5.0m,
            orig_time = DateTime.UtcNow.AddMinutes(-5),
            orig_time_uncer = 5.0m,
            likelihood = 0.7866m,
            num_stations = 7
        };

        // Generate the polygon dynamically based on the center coordinates and magnitude
        var polygon = GeneratePolygon(centerLat, centerLon, magnitude);

        // Generate the event message
        return new EventMessage
        {
            version = "0",
            orig_sys = "eqinfo2gm",
            message_type = "update",
            timestamp = DateTime.UtcNow,
            category = "live",
            alg_vers = "1.2.4 2024-01-14",
            instance = "eqinfo2gm-contour@eew-qw-int1",
            ref_id = "8",
            ref_src = "",
            core_info = coreInfo,
            contributors = new Contributors
            {
                contributor = new Contributor
                {
                    alg_instance = "finder@localhost",
                    alg_name = "finder",
                    alg_version = "finder-3.1.1_2022-07-14/finder-3.2.2_2022-09-28",
                    category = "live",
                    event_id = "1",
                    version = "1"
                }
            },
            fault_info = new FaultInfo
            {
                finite_fault = new FiniteFault
                {
                    atten_geom = true,
                    segment_number = 1,
                    segment_shape = "line",
                    segment = new List<Segment>
                    {
                        new Segment
                        {
                            vertices = new List<Vertex>
                            {
                                new Vertex { lat = 48.405m, lon = -123.412m, depth = 0.0m },
                                new Vertex { lat = 48.502m, lon = -123.917m, depth = 0.0m }
                            }
                        }
                    }
                }
            },
            gm_info = new GmInfo
            {
                gmcontour_pred = new GmcontourPred
                {
                    contour = new List<Contour>
                    {
                        new Contour { MMI = 2.0m, PGA = 0.7926m, PGV = 0.0365m, polygon = polygon },
                        new Contour { MMI = 3.0m, PGA = 2.9142m, PGV = 0.1347m, polygon = polygon }
                    }
                },
                gmpoint_obs = new GmpointObs
                {
                    pgv_obs = new List<PgvObs>
                    {
                        new PgvObs
                        {
                            SNCL = "QC01.QW.HHZ.--",
                            value = 0,
                            lat = 0,
                            lon = 0,
                            time = DateTime.UtcNow
                        }
                    },
                    pga_obs = new List<PgaObs>
                    {
                        new PgaObs
                        {
                            SNCL = "QC01.QW.HHZ.--",
                            value = 0,
                            lat = 0,
                            lon = 0,
                            time = DateTime.UtcNow
                        }
                    }
                }
            }
        };
    }

    // Method to generate a polygon around the center with dynamic size based on magnitude
    private string GeneratePolygon(decimal centerLat, decimal centerLon, decimal magnitude)
    {
        // Adjust the size of the polygon based on magnitude (larger magnitude means a larger polygon)
        decimal delta = magnitude / 10m;

        // Generate polygon coordinates around the center
        var coordinates = new List<string>
        {
            $"{centerLat + delta},{centerLon - delta}",
            $"{centerLat + delta},{centerLon + delta}",
            $"{centerLat - delta},{centerLon + delta}",
            $"{centerLat - delta},{centerLon - delta}"
        };

        return string.Join(" ", coordinates);
    }

    public static List<(double lat, double lon)> GeneratePolygon(double centerLat, double centerLon, double magnitude)
    {
        List<(double lat, double lon)> polygon = new List<(double, double)>();

        double radius = 0.5 + magnitude * 0.1; // Scale radius based on magnitude (approx. degrees)
        int numPoints = 8;
        double angleStep = 360.0 / numPoints;

        for (int i = 0; i <= numPoints; i++) // Loop one extra time to close the polygon
        {
            double angle = i * angleStep * (Math.PI / 180.0); // Convert degrees to radians
            double latOffset = radius * Math.Cos(angle);
            double lonOffset = radius * Math.Sin(angle) / Math.Cos(centerLat * (Math.PI / 180.0)); // Adjust for latitude scaling

            double lat = centerLat + latOffset;
            double lon = centerLon + lonOffset;
            polygon.Add((lat, lon));
        }

        return polygon;
    }
}
