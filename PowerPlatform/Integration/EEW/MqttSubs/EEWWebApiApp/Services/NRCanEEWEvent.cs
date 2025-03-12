using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Serialization;

[XmlRoot("event_message")]
public class EventMessage
{
    [XmlAttribute("version")]
    public string version { get; set; }

    [XmlAttribute("orig_sys")]
    public string orig_sys { get; set; }

    [XmlAttribute("message_type")]
    public string message_type { get; set; }

    [XmlAttribute("timestamp")]
    public string timestamp { get; set; }

    [XmlAttribute("category")]
    public string category { get; set; }

    [XmlAttribute("alg_vers")]
    public string alg_vers { get; set; }

    [XmlAttribute("instance")]
    public string instance { get; set; }

    [XmlAttribute("ref_id")]
    public string ref_id { get; set; }

    [XmlAttribute("ref_src")]
    public string ref_src { get; set; }

    [XmlElement("core_info")]
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

    [XmlElement("segment")]
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
    [XmlElement("contour")] 
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

public static class SampleDataGenerator
{
    private static Random _random = new Random();

    // Method to generate sample data based on user input
    public static EventMessage GenerateSampleData(decimal magnitude, decimal centerLat, decimal centerLon)
    {
        Random rand = new Random();

        // Generate core information based on magnitude and center coordinates
        var coreInfo = new CoreInfo
        {
            id = "StoneRiver" + magnitude,
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

        // Generate contours dynamically for MMI 2.0 to 8.0
        var contours = new List<Contour>();
        for (decimal mmi = 2.0m; mmi <= 8.0m; mmi += 1.0m)
        {
            decimal pga = (decimal)(rand.NextDouble() * (300 - 0.5) + 0.5); // Simulated PGA values
            decimal pgv = (decimal)(rand.NextDouble() * (30 - 0.1) + 0.1);  // Simulated PGV values
            string polygon = GeneratePolygon(centerLat, centerLon, magnitude, mmi);

            contours.Add(new Contour
            {
                MMI = mmi,
                PGA = pga,
                PGV = pgv,
                polygon = polygon
            });
        }

        // Generate the event message with the correct XML structure
        return new EventMessage
        {
            version = "0",
            orig_sys = "eqinfo2gm",
            message_type = "update",
            timestamp = DateTime.UtcNow.ToString(),
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
                    contour = contours // ✅ Now correctly places contour elements directly inside <gmcontour_pred>
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
    private static string GeneratePolygon(decimal centerLat, decimal centerLon, decimal magnitude, decimal mmi)
    {
        // Adjust size of the polygon based on magnitude and MMI
        decimal delta = (magnitude / 10m) * (1 + mmi / 10m);

        var coordinates = new List<string>();
        for (int i = 0; i < 8; i++)
        {
            double angle = (Math.PI / 4) * i; // Dividing 360 degrees into 8 sections
            decimal lat = centerLat + delta * (decimal)Math.Sin(angle);
            decimal lon = centerLon + delta * (decimal)Math.Cos(angle);
            coordinates.Add($"{lat},{lon}");
        }

        // Ensure the polygon is closed by repeating the first point at the end
        coordinates.Add(coordinates[0]);

        return string.Join(" ", coordinates);
    }


    private static List<Contour> GenerateContours(decimal centerLat, decimal centerLon, decimal magnitude)
    {
        var contours = new List<Contour>();
        Random rand = new Random();

        for (decimal mmi = 2.0m; mmi <= 8.0m; mmi += 1.0m)
        {
            decimal pga = (decimal)(rand.NextDouble() * (300 - 0.5) + 0.5); // Simulated PGA values
            decimal pgv = (decimal)(rand.NextDouble() * (30 - 0.1) + 0.1); // Simulated PGV values

            string polygon = GeneratePolygon(centerLat, centerLon, magnitude, mmi);

            contours.Add(new Contour
            {
                MMI = mmi,
                PGA = pga,
                PGV = pgv,
                polygon = polygon
            });
        }

        return contours;
    }
    public static (decimal, decimal) GenerateRandomBCCoordinate()
    {
        Random random = new Random();

        // Approximate boundaries for BC, Canada
        decimal minLat = 48.3m;  // Southernmost point
        decimal maxLat = 60.0m;  // Northernmost point
        decimal minLon = -139.0m; // Westernmost point
        decimal maxLon = -114.0m; // Easternmost point

        // Generate a random latitude and longitude within the BC boundaries
        decimal latitude = minLat + (decimal)random.NextDouble() * (maxLat - minLat);
        decimal longitude = minLon + (decimal)random.NextDouble() * (maxLon - minLon);

        return (latitude, longitude);
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
