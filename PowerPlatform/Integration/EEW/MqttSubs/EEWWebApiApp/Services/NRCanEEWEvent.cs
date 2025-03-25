using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Xml.Serialization;
using static EventMessageDm;

[XmlRoot("event_message")]
public class EventMessagePolygon
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
    public CoreInfo CoreInfo { get; set; }

    [XmlArray("contributors")]
    [XmlArrayItem("contributor")]
    public List<Contributor> Contributors { get; set; }

    [XmlElement("gm_info")]
    public GmInfoPoly GmInfo { get; set; }
}

[XmlRoot("event_message")]
public class EventMessageDm
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
    public CoreInfo CoreInfo { get; set; } = new CoreInfo();

    [XmlArray("contributors")]
    [XmlArrayItem("contributor")]
    public List<Contributor> Contributors { get; set; } = new List<Contributor>();

    [XmlElement("gm_info")]
    public GmInfoDm GmInfo { get; set; } = new GmInfoDm();
}

[XmlRoot("event_message")]
public class EventMessageMap
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

    [XmlArray("contributors")]
    [XmlArrayItem("contributor")]
    public List<Contributor> Contributors { get; set; } = new List<Contributor>();

    //[XmlElement("fault_info", IsNullable = true)]
    //public FaultInfo? FaultInfo { get; set; }  // No default initialization

    [XmlElement("gm_info")]
    public GmInfoMap gm_info { get; set; }
}

public class CoreInfo
{
    [XmlAttribute("id")]
    public string Id { get; set; }

    [XmlElement("mag")]
    public Measurement Mag { get; set; }

    [XmlElement("mag_uncer")]
    public Measurement MagUncer { get; set; }

    [XmlElement("lat")]
    public Measurement Lat { get; set; }

    [XmlElement("lat_uncer")]
    public Measurement LatUncer { get; set; }

    [XmlElement("lon")]
    public Measurement Lon { get; set; }

    [XmlElement("lon_uncer")]
    public Measurement LonUncer { get; set; }

    [XmlElement("depth")]
    public Measurement Depth { get; set; }

    [XmlElement("depth_uncer")]
    public Measurement DepthUncer { get; set; }

    [XmlElement("orig_time")]
    public Measurement OrigTime { get; set; }

    [XmlElement("orig_time_uncer")]
    public Measurement OrigTimeUncer { get; set; }

    [XmlElement("likelihood")]
    public decimal? Likelihood { get; set; }

    [XmlElement("num_stations")]
    public int? NumStations { get; set; }
}

public class Measurement
{
    [XmlAttribute("units")]
    public string Units { get; set; }

    [XmlText]
    public string Value { get; set; } // Use string to handle both decimal? and DateTime values
}

public class Contributors
{
    public List<Contributor> contributors { get; set; }
}

public class Contributor
{
    [XmlAttribute("alg_instance")]
    public string alg_instance { get; set; }
    [XmlAttribute("alg_name")]
    public string alg_name { get; set; }
    [XmlAttribute("alg_version")]
    public string alg_version { get; set; }
    [XmlAttribute("category")]
    public string category { get; set; }
    [XmlAttribute("event_id")]
    public string event_id { get; set; }
    [XmlAttribute("version")]
    public string version { get; set; }
}

public class FaultInfo
{
    [XmlAttribute("fault_type")]
    public FiniteFault finite_fault { get; set; }
}

public class FiniteFault
{
    [XmlAttribute("atten_geom")]
    public bool atten_geom { get; set; }
    [XmlAttribute("segment_number")]
    public int segment_number { get; set; }
    [XmlAttribute("segment_shape")]
    public string segment_shape { get; set; }

    [XmlElement("segment")]
    public List<Segment> segment { get; set; }
}

public class Segment
{
    [XmlAttribute("vertices")]
    public List<Vertex> vertices { get; set; }
}

public class Vertex
{
    [XmlAttribute("lat")]
    public decimal lat { get; set; }
    [XmlAttribute("lon")]
    public decimal lon { get; set; }
    [XmlAttribute("depth")]
    public decimal depth { get; set; }
}

public class GmInfoPoly
{
    [XmlElement("gmpoint_obs")]
    public GmpointObs GmpointObs { get; set; } = new GmpointObs();

    [XmlElement("gmcontour_pred")]
    public GmcontourPred GmcontourPred { get; set; } = new GmcontourPred();
}

public class GmInfoMap
{
    [XmlElement("gmpoint_obs")]
    public GmpointObs GmpointObs { get; set; } = new GmpointObs();

    //[XmlElement("gmcontour_pred")]
    //public GmcontourPred GmcontourPred { get; set; } = new GmcontourPred();

    [XmlElement("gmmap_pred")]
    public GmmapPred GmmapPred { get; set; } = new GmmapPred();

}

public class GmmapPred
{
    [XmlAttribute("number")]
    public int Number { get; set; }

    private const decimal UNSET = -1; // Choose an impossible value for your domain

    private decimal _pauseRadiusKm = UNSET;

    [XmlAttribute("pause_radius_km")]
    public decimal PauseRadiusKm
    {
        get => _pauseRadiusKm;
        set => _pauseRadiusKm = value;
    }

    private decimal _pauseDurationSeconds = UNSET;

    [XmlAttribute("pause_duration_seconds")]
    public decimal PauseDurationSeconds
    {
        get => _pauseDurationSeconds;
        set => _pauseDurationSeconds = value;
    }

    public bool ShouldSerializePauseRadiusKm() => _pauseRadiusKm != UNSET;
    public bool ShouldSerializePauseDurationSeconds() => _pauseDurationSeconds != UNSET;

    [XmlAttribute("pause_restricted")]
    public string PauseRestricted { get; set; }

    [XmlElement("grid_data")]
    public string GridData { get; set; }

    [XmlElement("grid_field")]
    public List<GridField> grid_field { get; set; } = new List<GridField>();
}

public class GridField
{
    [XmlAttribute("index")]
    public int Index { get; set; }

    [XmlAttribute("name")]
    public string Name { get; set; }

    [XmlAttribute("units")]
    public string Units { get; set; }
}

public class GmInfoDm
{
    [XmlElement("gmpoint_obs")]
    public GmpointObs gmpoint_obs { get; set; }
}

public class GmcontourPred
{
    private const decimal UNSET = -1; // Choose an impossible value for your domain

    private decimal _pauseRadiusKm = UNSET;

    [XmlAttribute("pause_radius_km")]
    public decimal PauseRadiusKm
    {
        get => _pauseRadiusKm;
        set => _pauseRadiusKm = value;
    }

    private decimal _pauseDurationSeconds = UNSET;

    [XmlAttribute("pause_duration_seconds")]
    public decimal PauseDurationSeconds
    {
        get => _pauseDurationSeconds;
        set => _pauseDurationSeconds = value;
    }

    public bool ShouldSerializePauseRadiusKm() => _pauseRadiusKm != UNSET;
    public bool ShouldSerializePauseDurationSeconds() => _pauseDurationSeconds != UNSET;

    [XmlAttribute("pause_restricted")]
    public string PauseRestricted { get; set; }

    [XmlAttribute("number")]
    public int Number { get; set; }

    [XmlElement("contour")]
    public List<Contour>? Contours { get; set; }

}

public class Contour
{
    [XmlElement("MMI")]
    public Measurement MMI { get; set; } = new Measurement();

    [XmlElement("PGA")]
    public Measurement PGA { get; set; } = new Measurement();

    [XmlElement("PGV")]
    public Measurement PGV { get; set; } = new Measurement();

    [XmlElement("polygon")]
    public Polygon Polygon { get; set; } = new Polygon();
}

public class Polygon
{
    [XmlAttribute("number")]
    public int Number { get; set; }

    [XmlText]
    public string Value { get; set; } // The polygon coordinates as a string
}

public class GmpointObs
{
    [XmlElement("pga_obs")]
    public PgaObs PgaObs { get; set; } = new PgaObs();
}
public class PgaObs
{
    [XmlAttribute("number")]
    public int Number { get; set; }

    [XmlElement("obs")]
    public List<Obs> Observations { get; set; } = new List<Obs>();
}
public class Obs
{
    [XmlAttribute("assoc")]
    public bool Assoc { get; set; }

    [XmlAttribute("orig_sys")]
    public string OrigSys { get; set; }

    [XmlElement("SNCL")]
    public string SNCL { get; set; }

    [XmlElement("value")]
    public Measurement Value { get; set; }

    [XmlElement("lat")]
    public Measurement Lat { get; set; }

    [XmlElement("lon")]
    public Measurement Lon { get; set; }

    [XmlElement("time")]
    public Measurement Time { get; set; }

    public bool ShouldSerializeAssoc()
    {
        return Assoc; // Only serialize if Assoc is explicitly set to true
    }
}

