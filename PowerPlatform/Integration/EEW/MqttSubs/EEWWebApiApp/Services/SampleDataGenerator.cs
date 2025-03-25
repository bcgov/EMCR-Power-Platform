using System;
using System.Collections.Generic;

public static class SampleDataGenerator
{
    private static readonly Random _random = new Random();

    // Method to generate sample data based on user input
    public static EventMessagePolygon GenerateSampleData(decimal magnitude, decimal centerLat, decimal centerLon)
    {
        // Generate core information based on magnitude and center coordinates
        var coreInfo = new CoreInfo
        {
            Mag = new Measurement { Value = magnitude.ToString(), Units = "Mw" },
            Id = "StoneRiver" + magnitude,
            MagUncer = new Measurement { Value = "0.5", Units = "Mw" },  // Example uncertainty for magnitude
            Lat = new Measurement { Value = centerLat.ToString(), Units = "deg" },
            LatUncer = new Measurement { Value = "0.25", Units = "deg" },  // Example uncertainty for latitude
            Lon = new Measurement { Value = centerLon.ToString(), Units = "deg" },
            LonUncer = new Measurement { Value = "0.25", Units = "deg" },  // Example uncertainty for longitude
            Depth = new Measurement { Value = "10.0", Units = "km" },
            DepthUncer = new Measurement { Value = "5.0", Units = "km" },
            OrigTime = new Measurement { Value = DateTime.UtcNow.ToString("o"), Units = "UTC" }, // ISO 8601 format
            OrigTimeUncer = new Measurement { Value = "5.0", Units = "sec" },
            Likelihood = 0.7866m,
            NumStations = 7
        };

        // Generate contours dynamically for MMI 2.0 to 8.0
        var contours = new List<Contour>();
        for (decimal mmi = 2.0m; mmi <= 8.0m; mmi += 1.0m)
        {
            decimal pga = (decimal)(_random.NextDouble() * (300 - 0.5) + 0.5); // Simulated PGA values
            decimal pgv = (decimal)(_random.NextDouble() * (30 - 0.1) + 0.1);  // Simulated PGV values
            string polygon = GeneratePolygon(centerLat, centerLon, magnitude, mmi);

            contours.Add(new Contour
            {
                MMI = new Measurement { Value = mmi.ToString(), Units = "" },
                PGA = new Measurement { Value = pga.ToString(), Units = "cm/s/s" },
                PGV = new Measurement { Value = pgv.ToString(), Units = "cm/s" },
                Polygon = new Polygon { Value = polygon, Number = 8 } // Number of points in the polygon
            });
        }

        // Generate the event message with the correct XML structure
        return new EventMessagePolygon
        {
            version = "0",
            orig_sys = "eqinfo2gm",
            message_type = "update",
            timestamp = DateTime.UtcNow.ToString("o"), // ISO 8601 format
            category = "live",
            alg_vers = "1.2.4 2024-01-14",
            instance = "eqinfo2gm-contour@eew-qw-int1",
            ref_id = "8",
            ref_src = "",
            CoreInfo = coreInfo,
            //Contributor = new Contributors
            //{
            //    Contributor = new List<Contributor>
            //    {
            //        new Contributor
            //        {
            //            AlgInstance = "finder@localhost",
            //            AlgName = "finder",
            //            AlgVersion = "finder-3.1.1_2022-07-14/finder-3.2.2_2022-09-28",
            //            Category = "live",
            //            EventId = "1",
            //            Version = "1"
            //        }
            //    }
            //},
            //gm_info = new GmInfo
            //{
            //    gmcontour_pred = new GmcontourPred
            //    {
            //        Number = contours.Count, // Number of contours
            //        Contours = contours
            //    },
            //    gmpoint_obs = new GmpointObs
            //    {
            //        pga_obs = new List<Obs>
            //            {
            //                new Obs
            //                {
            //                    Assoc = true,
            //                    OrigSys = "epic",
            //                    SNCL = "QC01.QW.HHZ.--",
            //                    Value = new Measurement { Value = "0", Units = "cm/s/s" },
            //                    Lat = new Measurement { Value = centerLat.ToString(), Units = "deg" },
            //                    Lon = new Measurement { Value = centerLon.ToString(), Units = "deg" },
            //                    Time = new Measurement { Value = DateTime.UtcNow.ToString("o"), Units = "UTC" }
            //                }
            //            }
            //    }
            //}
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

    // Method to generate random coordinates within British Columbia, Canada
    public static (decimal Latitude, decimal Longitude) GenerateRandomBCCoordinate()
    {
        // Approximate boundaries for BC, Canada
        decimal minLat = 48.3m;  // Southernmost point
        decimal maxLat = 60.0m;  // Northernmost point
        decimal minLon = -139.0m; // Westernmost point
        decimal maxLon = -114.0m; // Easternmost point

        // Generate a random latitude and longitude within the BC boundaries
        decimal latitude = minLat + (decimal)_random.NextDouble() * (maxLat - minLat);
        decimal longitude = minLon + (decimal)_random.NextDouble() * (maxLon - minLon);

        return (latitude, longitude);
    }
}